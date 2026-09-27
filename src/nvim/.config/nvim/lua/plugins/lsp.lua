return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},

        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
        },
      },
    },
  },
}
