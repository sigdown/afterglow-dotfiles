#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

mapfile -t packages < <(
    grep -vE '^[[:space:]]*(#|$)' packages/base.txt
)

sudo pacman -Syu --needed "${packages[@]}"

stow --restow \
    hypr \
    waybar \
    kitty \
    fuzzel \
    mako \
    scripts

chmod +x scripts/.local/bin/*

xdg-user-dirs-update
sudo systemctl enable --now NetworkManager

echo "Bootstrap готов."
