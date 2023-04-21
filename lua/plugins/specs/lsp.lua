return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
      {
        "L3MON4D3/LuaSnip",
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
        config = true,
        keys = {
          {
            "<tab>",
            function()
              return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
          },
          { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
      },
    },
    config = function ()
      require("plugins.configs.completion.cmp")
    end
  },
  -- LSP.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
    },
    config = function ()
      require("plugins.configs.lsp.lspconfig")
    end,
    event = "BufReadPre",
  },
  {
    "j-hui/fidget.nvim",
    config = true,
    event = "User LspAttachPre"
  },
  "folke/trouble.nvim",
  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  config = function ()
    require("lspsaga").setup()
  end
}
