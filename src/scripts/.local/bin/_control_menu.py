import fcntl
import os
import shutil
import subprocess
import time


def label(value):
    return " ".join(str(value).split())


def menu(prompt, entries=None, placeholder=None):
    args = ["fuzzel", "--dmenu", "--log-level=error", "--prompt", f"{label(prompt)} › "]
    if entries is None:
        args.extend(["--password", "--lines", "0", "--placeholder", placeholder or "Password…"])
        content = ""
    else:
        args.extend(["--index", "--only-match", "--no-sort", "--lines", str(min(len(entries), 10)),
                     "--placeholder", placeholder or "Select…"])
        content = "\n".join(label(entry) for entry in entries) + "\n"

    deadline = time.monotonic() + 2
    while True:
        result = subprocess.run(args, input=content, capture_output=True, text=True, encoding="utf-8")
        if not result.returncode or "failed to acquire lock" not in result.stderr:
            break
        if time.monotonic() >= deadline:
            raise RuntimeError("Fuzzel is busy. Close the other menu and try again.")
        time.sleep(0.05)

    if result.returncode in (1, 2) and not result.stderr.strip():
        raise SystemExit(0)
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "Failed to open Fuzzel")
    if entries is None:
        value = result.stdout.removesuffix("\n")
        if not value:
            raise SystemExit(0)
        return value
    try:
        index = int(result.stdout.strip())
    except ValueError:
        raise SystemExit(0)
    if not 0 <= index < len(entries):
        raise SystemExit(0)
    return index


def submenu(prompt, entries, actions=()):
    index = menu(prompt, ["× Close", "← Back", *actions, *entries])
    if index == 0:
        raise SystemExit(0)
    return None if index == 1 else index - 2


def instance_lock(name):
    runtime = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    lock = open(os.path.join(runtime, f"{name}.lock"), "a")
    try:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except BlockingIOError:
        lock.close()
        raise SystemExit(0)
    return lock


def require_commands(*commands):
    for command in commands:
        if shutil.which(command) is None:
            raise RuntimeError(f"Command not found: {command}")


def notify(app_name, title, message):
    if shutil.which("notify-send"):
        subprocess.run(["notify-send", f"--app-name={app_name}", "--", title, message])
