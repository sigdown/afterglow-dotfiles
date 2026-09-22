alias b := build
alias s := stow

init:
    #!/bin/bash

    cd tools/

    python3 -m venv .venv
    source .venv/bin/activate

    pip install Jinja2

build:
    #!/bin/bash
    set -euo pipefail

    cd tools/
    source .venv/bin/activate
    
    python3 build.py

    hyprctl reload

stow:
    #!/bin/bash
    set -eou pipefail
    
    for pkg in build/*; do
        stow -v -d build -t "$HOME" "$(basename "$pkg")"
    done
