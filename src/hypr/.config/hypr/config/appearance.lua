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

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("animeFocus", { type = "bezier", points = { { 0.33, 0.0 }, { 0.67, 1.0 } } })
hl.curve("animeTactical", { type = "bezier", points = { { 0.1, 0.8 }, { 0.1, 1.0 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 2.0, bezier = "easeOutQuint" })

hl.animation({ leaf = "windows", enabled = true, speed = 2.5, bezier = "animeFocus" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.0, bezier = "animeTactical", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "animeFocus", style = "slide" })

hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.0, bezier = "linear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.0, bezier = "linear" })
hl.animation({ leaf = "fade", enabled = true, speed = 1.0, bezier = "linear" })

hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "animeFocus" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "animeTactical", style = "popin 85%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.5, bezier = "animeFocus", style = "popin 85%" })
hl.animation({ leaf = "fadeLayersIn", enabled = false })
hl.animation({ leaf = "fadeLayersOut", enabled = false })

hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "animeFocus", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.5, bezier = "animeFocus", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.5, bezier = "animeFocus", style = "slide" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 2.0, bezier = "quick" })

hl.layer_rule({
	match = { namespace = "fuzzel" },
	ignore_alpha = 0.0,
})

hl.layer_rule({
	match = { namespace = "mako" },
	ignore_alpha = 0.0,
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
