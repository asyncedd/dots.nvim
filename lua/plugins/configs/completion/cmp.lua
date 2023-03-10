local kind_icons = require("core.utils.icons.kind")

local cmp = require("cmp")

vim.defer_fn(function()
  require("nvim-autopairs").setup()
end, 0)

vim.schedule(function()
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        max_height = 20,
        max_width = 50,
        scrollbar = true,
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      },
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({
        select = false,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
cmp.select_prev_item()
        else
          fallback()
        end
      end,
    }),
sources = cmp.config.sources({
  { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
    }),
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment") 
          and not context.in_syntax_group("Comment")
      end
    end,
    view = {
      entries = {
        name = 'custom',
        selection_order = 'near_cursor'
      },
    },
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          -- latex_symbols = "[LaTeX]",
        })[entry.source.name]
        return vim_item
      end
    },
    experimental = {
      ghost_text = true,
    },
  })
end)
