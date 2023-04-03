local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "neovim/nvim-lspconfig",
    init = lazyLoad("nvim-lspconfig"),
    config = function()
      require("lsp.config")
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("lsp.mason")
        end,
        init = lazyLoad("mason.nvim"),
        build = "<cmd>Mason<cmd>",
        cmd = {
          "Mason",
        },
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        -- event = "BufReadPre",
      },
      "folke/neodev.nvim",
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("lsp.saga")
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
      "SmiteshP/nvim-navbuddy",
      "MunifTanjim/nui.nvim",
      "SmiteshP/nvim-navic",
      {
        "Kasama/nvim-custom-diagnostic-highlight",
        config = true,
      },
      {
        "VidocqH/lsp-lens.nvim",
        config = true,
      },
    },
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   config = true,
  --   init = lazyLoad("fidget.nvim"),
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = lazyLoad("null-ls.nvim"),
    config = function()
      require("lsp.null")
    end,
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "<leader>rn", ":IncRename " },
    },
  },
}
