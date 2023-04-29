return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls" },
        },
        config = true,
      },
      { "folke/neodev.nvim", config = true },
    },
    config = function()
      require("plugins.configs.lsp.native")
      require("plugins.configs.lsp.config")
    end,
    event = "VeryLazy",
  },
}
