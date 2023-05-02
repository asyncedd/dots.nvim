require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./luasnip" } })

require("luasnip").setup({
  history = true,
  update_events = { "TextChanged", "TextChangedI" },
  region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
  delete_check_events = { "TextChanged", "InsertLeave" },
})
