return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Use the toolchain from the environment running Neovim (host or Distrobox).
        clangd = { mason = false },

        -- flutter-tools owns the Dart server and SDK selection from PATH.
        dartls = { enabled = false },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      -- Prefer tools from the current environment; Mason remains a fallback.
      PATH = "append",
    },
  },
}
