#!/usr/bin/env python3

from pathlib import Path
import tomllib

from jinja2 import Environment, FileSystemLoader, StrictUndefined


ROOT = Path(__file__).resolve().parent.parent
THEME_DIR = ROOT / "theme"
TEMPLATES_DIR = THEME_DIR / "templates"
PALETTE_FILE = THEME_DIR / "palette.toml"


TARGETS = {
    "waybar-colors.css.j2":
        "waybar/.config/waybar/colors.css",
    "hypr-colors.lua.j2":
        "hypr/.config/hypr/theme/colors.lua",
    "fuzzel.ini.j2":
        "fuzzel/.config/fuzzel/fuzzel.ini",
    "mako-config.j2":
        "mako/.config/mako/config",
    "kitty.conf.j2":
        "kitty/.config/kitty/kitty.conf",
    "starship.toml.j2":
        "starship/.config/starship.toml",
    "zshrc.j2":
        "zsh/.zshrc",
}


def load_palette() -> dict:
    with PALETTE_FILE.open("rb") as file:
        return tomllib.load(file)


def create_environment() -> Environment:
    env = Environment(
        loader=FileSystemLoader(TEMPLATES_DIR),
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


def render_target(
    env: Environment,
    context: dict,
    template_name: str,
    output_path: str,
) -> None:
    template = env.get_template(template_name)
    rendered = template.render(**context)

    output = ROOT / output_path
    output.parent.mkdir(parents=True, exist_ok=True)

    if not rendered.endswith("\n"):
        rendered += "\n"

    output.write_text(rendered, encoding="utf-8")

    print(f"generated  {output.relative_to(ROOT)}")


def main() -> None:
    palette = load_palette()
    env = create_environment()

    for template_name, output_path in TARGETS.items():
        render_target(
            env=env,
            context=palette,
            template_name=template_name,
            output_path=output_path,
        )


if __name__ == "__main__":
    main()
