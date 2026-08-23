#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

mapfile -t packages < <(
    sed -E 's/[[:space:]]*#.*$//; /^[[:space:]]*$/d' packages/base.txt
)

sudo pacman -Syu --needed -- "${packages[@]}"

python tools/build.py

stow_packages=(
    hypr
    quickshell
    waybar
    kitty
    fuzzel
    mako
    scripts
    starship
    zsh
)

for pkg in "${stow_packages[@]}"; do
    [[ -d "build/$pkg" ]] && \
        stow --restow --dir build --target "$HOME" "$pkg"
done

if [[ -d build/scripts/.local/bin ]]; then
    find build/scripts/.local/bin -type f -exec chmod +x {} +
fi

xdg-user-dirs-update
sudo systemctl enable --now NetworkManager sshd

echo "Bootstrap готов."
