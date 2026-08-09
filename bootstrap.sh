#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

mapfile -t packages < <(
    grep -vE '^[[:space:]]*(#|$)' packages/base.txt
)

sudo pacman -Syu --needed "${packages[@]}"

python tools/build.py

stow --restow --dir build --target "$HOME" \
    hypr \
    waybar \
    kitty \
    fuzzel \
    mako \
    scripts \
    starship \
    zsh

chmod +x build/scripts/.local/bin/*

xdg-user-dirs-update
sudo systemctl enable --now NetworkManager

echo "Bootstrap готов."
