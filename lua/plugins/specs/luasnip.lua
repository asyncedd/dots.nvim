return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "honza/vim-snippets",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      },
      {
        "molleweide/LuaSnip-snippets.nvim",
        config = function()
          require("luasnip.loaders.from_lua").lazy_load()
        end,
      },
    },
    event = { "InsertEnter", "VeryLazy" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./luasnip" })
    end,
  },
}
