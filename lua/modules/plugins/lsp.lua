local lsp = {}

lsp["williamboman/mason.nvim"] = {
  event = "BufReadPost",
  config = require("lsp.mason"),
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" }
  }
}

return lsp
