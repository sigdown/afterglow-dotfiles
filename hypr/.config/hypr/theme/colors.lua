-- Temporary semantic color bridge.
-- These values preserve the current config exactly.
-- We will replace them with the Afterglow palette in the next design pass.

return {
    surface = {
        base    = "#07111F",
        raised  = "#101A28",
        overlay = "#182230",
        hover   = "#202C3A",
    },

    text = {
        primary   = "#EBC99A",
        secondary = "#C8A982",
        muted     = "#8F9187",
        on_accent = "#07111F",
    },

    border = {
        subtle   = "rgba(2b3441ff)",
        strong   = "#83553C",
        focus    = "rgba(c5662aff)",
        critical = "#C65E49",
    },

    accent = {
        primary   = "#C5662A",
        secondary = "#2F8F80",
    },

    status = {
        warning  = "#D49A57",
        critical = "#C65E49",
    },
}
