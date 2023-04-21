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
      "j-hui/fidget.nvim",
      "folke/neodev.nvim"
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  }
}

return M
