return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
    },
    config = function()
      require("plugins.configs.coding.cmp")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
}

