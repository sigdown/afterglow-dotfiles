--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

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
	no_anim = true,
	float = true,
	center = true,
})
