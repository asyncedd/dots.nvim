local lsp = {}

lsp["williamboman/mason.nvim"] = {
  event = "BufReadPost",
  config = require("lsp.mason"),
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" }
  }
}

return lsp
