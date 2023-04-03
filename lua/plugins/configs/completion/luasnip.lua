local status, luasnip = pcall(require, "luasnip")
if (not status) then return end

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.setup({
  history = true,
  delete_check_events = "TextChanged",
})
