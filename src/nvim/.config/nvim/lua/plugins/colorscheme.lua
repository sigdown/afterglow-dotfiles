return {
  {
    "folke/tokyonight.nvim",

    opts = {
      style = "moon",
      -- Keep the main editing windows transparent.
      transparent = true,

      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        -- Base styles for integrations; explicit panel and popup backgrounds
        -- are defined in theme.colors and theme.highlights.
        sidebars = "transparent",
        floats = "transparent",
      },

      plugins = {
        auto = true,
      },

      on_colors = require("theme.colors"),
      on_highlights = require("theme.highlights"),
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
