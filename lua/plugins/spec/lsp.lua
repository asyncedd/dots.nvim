local M = {}

M = {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
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
