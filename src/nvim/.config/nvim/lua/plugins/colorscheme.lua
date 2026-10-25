return {
  {
    "folke/tokyonight.nvim",

    opts = {
      style = "moon",
      transparent = true,

      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
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
