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
    config = function(_, opts)
      require("npairs-int-upair").setup(opts)

      local event = require('cmp').event
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "windwp/nvim-autopairs",
      "altermo/ultimate-autopair.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "kylechui/nvim-surround",
    config = true,
    keys = {
      { "s", mode = { "o" } },
    },
  },
  {
    "abecodes/tabout.nvim",
    config = true,
    event = { "InsertEnter" },
  },
}
