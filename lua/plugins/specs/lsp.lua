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
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require("plugins.configs.lsp.null")
    end,
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = { "stylua" },
        },
        config = true,
      },
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("null-ls").setup(opts)
    end,
  },
}
