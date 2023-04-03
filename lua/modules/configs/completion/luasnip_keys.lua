local M = {}

M = {
  {
    "<tab>",
    function()
      return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    end,
    expr = true, silent = true, mode = "i",
  },
  { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
  { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
}

return M
