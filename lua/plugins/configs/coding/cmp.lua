local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local compare = require("cmp.config.compare")

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
    { name = "buffer", keyword_length = 3 },
    { name = "cmp_tabnine", keyword_length = 3 },
    { name = "codeium", keyword_length = 3 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 30, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    }),
  },
  experimental = {
    ghost_text = true,
  },
  sorting = {
    priority_weight = 0.8,
    comparators = {
      compare.scopes,
      compare.locality,
      compare.score,
      compare.offset,
      compare.recently_used,
      compare.order,
    },
  },
}
