local M = {}

M = {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = require("plugins.configs.lsp.lspconfig"),
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    }
  },
  {
    "wesleimp/stylua.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
}

return M
