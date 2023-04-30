return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)

      require("plugins.highlight.coding.cmp")
    end,
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "codeium.nvim",
    },
  },
  {
    "jcdickinson/codeium.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-cmp",
    },
    event = "VeryLazy",
  },
}

