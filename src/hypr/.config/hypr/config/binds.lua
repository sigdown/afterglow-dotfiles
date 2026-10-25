---------------------
---- KEYBINDINGS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "fuzzel"
local mainMod     = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("$HOME/.local/bin/session-menu")
)

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("$HOME/.local/bin/clipboard-picker"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("$HOME/.local/bin/control-audio"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("$HOME/.local/bin/control-network"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("$HOME/.local/bin/control-bluetooth"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + G", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- H/J/K/L: focus, Shift: move the window, Ctrl: resize it.
local directions = {
    { key = "H", direction = "left",  x = -32, y = 0 },
    { key = "J", direction = "down",  x = 0,   y = 32 },
    { key = "K", direction = "up",    x = 0,   y = -32 },
    { key = "L", direction = "right", x = 32,  y = 0 },
}

for _, item in ipairs(directions) do
    hl.bind(mainMod .. " + " .. item.key, hl.dsp.focus({ direction = item.direction }))
    hl.bind(mainMod .. " + SHIFT + " .. item.key, hl.dsp.window.move({ direction = item.direction }))
    hl.bind(mainMod .. " + CTRL + " .. item.key,
        hl.dsp.window.resize({ x = item.x, y = item.y, relative = true }),
        { repeating = true })
end

-- Arrow keys remain available for focus.
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(
    "Print",
    hl.dsp.exec_cmd("$HOME/.local/bin/take-screenshot")
)

hl.bind(
    mainMod .. " + ALT + L",
    hl.dsp.exec_cmd("pidof hyprlock >/dev/null || hyprlock")
)

-- Switch workspaces with mainMod + [0-9].
-- Move active window with mainMod + SHIFT + [0-9].
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Special workspace / scratchpad.
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- Scroll through existing workspaces.
hl.bind(mainMod .. " + ALT + J", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Move/resize windows with mainMod + LMB/RMB and dragging.
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Multimedia keys.
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)
