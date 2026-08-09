#!/usr/bin/env python3

from pathlib import Path
import shutil
import tomllib

from jinja2 import Environment, FileSystemLoader, StrictUndefined


ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = ROOT / "src"
BUILD_DIR = ROOT / "build"
PALETTE_FILE = SRC_DIR / "theme" / "palette.toml"


def load_palette() -> dict:
    with PALETTE_FILE.open("rb") as file:
        return tomllib.load(file)


def create_environment() -> Environment:
    env = Environment(
        loader=FileSystemLoader(SRC_DIR),
        undefined=StrictUndefined,
        autoescape=False,
        keep_trailing_newline=True,
        trim_blocks=True,
        lstrip_blocks=True,
    )
    env.filters["hex_alpha"] = hex_alpha
    env.filters["with_alpha"] = with_alpha
    env.filters["hypr_rgba"] = hypr_rgba
    return env


def hex_alpha(value: str, alpha: str = "FF") -> str:
    return f"{value.removeprefix('#')}{alpha}"


def with_alpha(value: str, alpha: str = "FF") -> str:
    return f"{value}{alpha}"


def hypr_rgba(value: str) -> str:
    return f"rgba({hex_alpha(value)})"


def render_template(env: Environment, context: dict, source: Path, target: Path) -> None:
    template = env.get_template(source.relative_to(SRC_DIR).as_posix())
    rendered = template.render(**context)

    if not rendered.endswith("\n"):
        rendered += "\n"

    target.write_text(rendered, encoding="utf-8")
    shutil.copymode(source, target)


def build_package(env: Environment, context: dict, package: Path) -> None:
    for source in package.rglob("*"):
        if not source.is_file():
            continue

        relative_path = source.relative_to(SRC_DIR)
        if source.suffix == ".j2":
            target = BUILD_DIR / relative_path.with_suffix("")
            target.parent.mkdir(parents=True, exist_ok=True)
            render_template(env, context, source, target)
        else:
            target = BUILD_DIR / relative_path
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, target)


def main() -> None:
    shutil.rmtree(BUILD_DIR, ignore_errors=True)
    BUILD_DIR.mkdir()

    context = load_palette()
    env = create_environment()

    for package in SRC_DIR.iterdir():
        if package.is_dir() and package.name != "theme":
            build_package(env, context, package)


if __name__ == "__main__":
    main()
