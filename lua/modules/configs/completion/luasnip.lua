return function()
  require("luasnip").setup({
    history = true,
    delete_check_events = "TextChanged",
  })
end
