-- Original animation profile. Durations are in deciseconds: 3.5 = 350 ms.
-- Unset children inherit their parent; only different behavior is overridden.
local duration = 3.5

hl.config({ animations = { enabled = true } })

hl.curve("retro_bounce", {
    type = "bezier",
    points = { { 0.17, 1.15 }, { 0.25, 1.0 } },
})
hl.curve("smooth_close", {
    type = "bezier",
    points = { { 0.4, 0.0 }, { 0.2, 1.0 } },
})
hl.curve("fast_slide", {
    type = "bezier",
    points = { { 0.2, 0.0 }, { 0.1, 1.0 } },
})

-- Preserve the original complementary opacity curves.
hl.curve("solid_in", {
    type = "bezier",
    points = { { 0.0, 1.0 }, { 0.0, 1.0 } },
})
hl.curve("solid_out", {
    type = "bezier",
    points = { { 1.0, 0.0 }, { 1.0, 0.0 } },
})

-- Border color transitions inherit global.
hl.animation({ leaf = "global", enabled = true, speed = duration, bezier = "fast_slide" })

-- windowsIn and windowsMove retain the original inherited bounce.
hl.animation({ leaf = "windows", enabled = true, speed = duration, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = duration, bezier = "smooth_close", style = "popin 0%" })

hl.animation({ leaf = "fade", enabled = true, speed = duration, bezier = "solid_in" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = duration, bezier = "solid_out" })

-- Keep the original distinct opening/closing curves for layers too.
hl.animation({ leaf = "layers", enabled = true, speed = duration, bezier = "retro_bounce", style = "popin 0%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = duration, bezier = "smooth_close", style = "popin 0%" })
-- fadeLayers and fadeLayersIn inherit solid_in from fade.
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = duration, bezier = "solid_out" })

hl.animation({ leaf = "workspaces", enabled = true, speed = duration, bezier = "fast_slide", style = "slide" })
