return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = require("plugins.configs.lsp.lspconfig"),
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      {
        "j-hui/fidget.nvim",
        opts = {
          text = {
            spinner = "dots"
          }
        },
        config = true,
      },
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      ui = {
        theme = 'round',
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
      }
    },
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  }
}
