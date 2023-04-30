return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)

      require("plugins.highlight.coding.cmp")

      require("plugins.configs.coding.cmp-cmd")
    end,
    event = { "InsertEnter", "VeryLazy", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-cmdline",
    },
  },
  {
    "altermo/npairs-integrate-upair",
    opts = function()
      require("plugins.configs.coding.autopairs")
    end,
    config = function(opts)
      require("npairs-int-upair").setup(opts)

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
    dependencies = {
      "altermo/ultimate-autopair.nvim",
      "windwp/nvim-autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
  },
}

