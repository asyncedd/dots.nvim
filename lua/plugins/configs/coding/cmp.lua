local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")

vim.api.nvim_create_autocmd(
  { "TextChangedI", "TextChangedP" },
  {
    callback = function()
      local line = vim.api.nvim_get_current_line()
      local cursor = vim.api.nvim_win_get_cursor(0)[2]

      local current = string.sub(line, cursor, cursor + 1)
      if current == "." or current == "," or current == " " then
        require("cmp").close()
      end

      local before_line = string.sub(line, 1, cursor + 1)
      local after_line = string.sub(line, cursor + 1, -1)
      if not string.match(before_line, '^%s+$') then
        if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
          require("cmp").complete()
        end
      end
    end,
    pattern = "*"
  })

return {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s", "c" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = false }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    }),
    ["<C-e>"] = cmp.mapping.abort(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 30, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  },
  experimental = {
    ghost_text = true,
  },
}
