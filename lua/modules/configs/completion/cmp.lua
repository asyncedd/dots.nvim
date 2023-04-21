return function()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  cmp.setup({
    window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    },
    snippet = {
      expand = function (args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
      { name = "plugins" },
      { name = "emoji" },
      { name = "nerdfont" },
      { name = "latex_symbols" },
    }),
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        menu = ({
          buffer = "✨ [Buffer]",
          nvim_lsp = "🧠 [LSP]",
          luasnip = "✂ [LuaSnip]",
          nvim_lua = "✨ [Lua]",
          latex_symbols = "✨ [Latex]",
          path = "🧱 [Path]",
          plugins = "🔨 [Plugins]",
          emoji = "😀 [Emoji]",
          nerdfont = "✒ [NerdFont]"
        })
      })
    },
    experimental = {
      ghost_text = true
    },
    view = {
      entries = {name = 'custom', selection_order = 'near_cursor' }
    },
  })
end
