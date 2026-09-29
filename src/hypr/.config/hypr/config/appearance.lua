local colors = require("theme.colors")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 12,

		border_size = 2,

		col = {
			active_border = colors.border.focus,
			inactive_border = colors.border.subtle,
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 6,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 7,
			passes = 5,
			vibrancy = 0.4,
		},
	},

	animations = {
		enabled = true,
	},
})
--------------------
---- ANIMATION---------------
--------------------
hl.curve("retro_bounce", { type = "bezier", points = { { 0.17, 1.15 }, { 0.25, 1.0 } } })
hl.curve("smooth_close", { type = "bezier", points = { { 0.4, 0.0 }, { 0.2, 1.0 } } })
hl.curve("fast_slide", { type = "bezier", points = { { 0.2, 0.0 }, { 0.1, 1.0 } } })
hl.curve("solid_in", { type = "bezier", points = { { 0.0, 1.0 }, { 0.0, 1.0 } } })
hl.curve("solid_out", { type = "bezier", points = { { 1.0, 0.0 }, { 1.0, 0.0 } } })

hl.animation({ leaf = "global", enabled = true, speed = 3.5, bezier = "fast_slide" })
hl.animation({ leaf = "border", enabled = true, speed = 3.5, bezier = "fast_slide" })

hl.animation({ leaf = "windows", enabled = true, speed = 3.5, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.5, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "smooth_close", style = "popin 0%" })

hl.animation({ leaf = "fade", enabled = true, speed = 3.5, bezier = "solid_in" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3.5, bezier = "solid_in" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3.5, bezier = "solid_out" })

hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.5, bezier = "smooth_close", style = "popin 0%" })

hl.animation({ leaf = "fadeLayers", enabled = true, speed = 3.5, bezier = "solid_in" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.5, bezier = "solid_in" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3.5, bezier = "solid_out" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "fast_slide", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3.5, bezier = "fast_slide", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.5, bezier = "fast_slide", style = "slide" })

hl.layer_rule({
	match = { namespace = "fuzzel" },
	ignore_alpha = 0.0,
})

hl.layer_rule({
	match = { namespace = "mako" },
	ignore_alpha = 0.0,
})

hl.window_rule({
	match = { class = "org.telegram.desktop", title = "Media viewer" },
	"noanim", -- просто передаем флаг строкой
})

-----------------
---- LAYOUTS ----
-----------------
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-------------------------
---- SMART GAPS NOTES ----
-------------------------

-- Uncomment if we decide to use smart gaps later.
--
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
