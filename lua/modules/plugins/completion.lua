return {  
  {
    "hrsh7th/nvim-cmp",
    event = "BufReadPost",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "onsails/lspkind.nvim" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
      { "chrisgrieser/cmp-nerdfont" },
      { "KadoBOT/cmp-plugins" },
      { "kdheepak/cmp-latex-symbols" },
    },
    config = require("completion.cmp")
  },
  {
    "L3MON4D3/LuaSnip",
    event = "BufReadPost",
    dependencies = {
      -- {
      --   "rafamadriz/friendly-snippets",
      --   config = require("completion.friendly_snippets")
      -- }
    },
    config = require("completion.luasnip"),
    keys = require("completion.luasnip_keys")
  }
}
