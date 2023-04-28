return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.coding.cmp")
    end,
    config = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
  },
  {
    "altermo/npairs-integrate-upair",
    opts = function()
      return require("plugins.configs.coding.autopairs")
    end,
    config = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "windwp/nvim-autopairs",
      "altermo/ultimate-autopair.nvim",
    },
  },
}

