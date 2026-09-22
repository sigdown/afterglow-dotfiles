#!/bin/bash

source tools/.venv/bin/activate

python3 tools/build.py

hyprctl reload
