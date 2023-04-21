return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
    },
    event = "InsertEnter",
    config = function()
      require("plugins.configs.completion.cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- dependencies = {
    --   "rafamadriz/friendly-snippets"
    -- },
    -- build = "make install_jsregexp",
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    -- config = function()
    --   require("plugins.configs.completion.luasnip")
    -- end,
  }
}
