require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./luasnip" } })
