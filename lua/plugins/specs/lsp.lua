return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("plugins.configs.lsp.config")(opts)
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          {
            "williamboman/mason.nvim",
            opts = true,
          },
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      sources = {
        stylua = {},
      },
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("plugins.configs.lsp.null")(opts)
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
}
