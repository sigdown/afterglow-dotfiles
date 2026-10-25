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

hl.window_rule({
	match = { modal = true },
	float = true,
	center = true,
})

hl.window_rule({
	match = { class = "^(imv|mpv)$" },
	float = true,
	center = true,
})

hl.window_rule({
	match = { class = "^(org.telegram.desktop|TelegramDesktop|telegramdesktop)$", title = "^Media viewer$" },
	float = true,
})

-- Screenshot selection must disappear before grim captures the frame.
hl.layer_rule({
	match = { namespace = "^selection$" },
	no_anim = true,
})
