local cmp = require("cmp")
local compare = require("cmp.config.compare")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),

    ["<C-e>"] = cmp.mapping.abort(),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        -- luasnip.expand_or_jump()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        -- elseif has_words_before() then
        --   cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        -- luasnip.jump(-1)
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    {
      name = "treesitter",
      keyword_length = 5,
    },
    {
      name = "buffer",
      keyword_length = 5,
    },
  }),

  formatting = {
    -- fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        mode = "symbol_text", -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      })(entry, vim_item)

      -- local strings = vim.split(vim_item.kind, "%s+", { trimempty = true })
      -- kind.kind = string.format(" [%s] %s ", strings[1], strings[2])
      return kind
    end,
  },

  sorting = {
    priority_weight = 0.8,
    comparators = {
      -- compare.score_offset, -- not good at all
      compare.scopes, -- treesitter scope
      compare.locality,
      compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      compare.offset,
      compare.recently_used,
      compare.order,
      -- compare.scopes, -- what?
      -- compare.sort_text,
      -- compare.exact,
      -- compare.kind,
      -- compare.length,
    },
  },
})
