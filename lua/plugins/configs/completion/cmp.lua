return function()
  local cmp = require("cmp")
  local kindIcons = require("core.utils.icons.kind")

  cmp.setup({
    snippet = {
      expand = function(args)
	require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
	scrollbar = true,
      },
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    }),
    formatting = {
      format = function(entry, vim_item)
	-- Kind icons
	vim_item.kind = string.format('%s %s', kindIcons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind Source
	vim_item.menu = ({
	  buffer = "[Buffer]",
	  nvim_lsp = "[LSP]",
	  luasnip = "[LuaSnip]",
	  nvim_lua = "[Lua]",
	  latex_symbols = "[LaTeX]",
	})[entry.source.name]
	return vim_item
      end
    },
    experimental = {
      ghost_text = true,
    },
  })
end

