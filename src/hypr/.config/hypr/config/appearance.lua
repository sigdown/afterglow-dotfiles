local colors = require("theme.colors")

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
			enabled = false,
		},
	},

	dwindle = {
		preserve_split = true,
	},
})
