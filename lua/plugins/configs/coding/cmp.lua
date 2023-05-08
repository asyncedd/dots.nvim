local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local compare = require("cmp.config.compare")

local kind_icons = {
  -- if you change or add symbol here
  -- replace corresponding line in readme
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
  Codeium = "",
  TabNine = "",
}

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
    { name = "emoji" },
    { name = "buffer", keyword_length = 3 },
    { name = "cmp_tabnine", keyword_length = 3 },
    { name = "codeium", keyword_length = 3 },
    { name = "rg", keyword_length = 3 },
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
      maxwidth = 30,
      menu = {
        nvim_lsp = "🔍",
        luasnip = "📦",
        cmp_tabnine = "🧠",
        buffer = "📝",
        emoji = "😃",
        cmdline = "🐧",
        codeium = "🤖",
        rg = "🔭",
      },
      before = function(_, vim_item)
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
        vim_item.kind = vim_item.kind .. " "
        return vim_item
      end,
    }),
  },
  experimental = {
    ghost_text = {
      -- HACK: Avoid this super weird error.
      hl_group = "Comment",
    },
  },
  sorting = {
    priority_weight = 0.8,
    comparators = {
      compare.scopes,
      compare.locality,
      compare.score,
      compare.recently_used,
      compare.offset,
      compare.order,
    },
  },
  window = {
    completion = {
      border = "shadow",
    },
    documentation = {
      border = "shadow",
    },
  },
  performance = {
    fetching_timeout = 15,
  },
}
