local mocha = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = mocha.pink, bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = mocha.pink, bold = true })

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local compare = require("cmp.config.compare")
local cmp_buffer = require("cmp_buffer")
local ts_utils = require("nvim-treesitter.ts_utils")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on({
  "confirm_done",
  cmp_autopairs.on_confirm_done(),
})

---@diagnostic disable
cmp.setup({
  -- matching = {
  --   disallow_fuzzy_matching = true,
  --   disallow_fullfuzzy_matching = true,
  --   disallow_partial_fuzzy_matching = true,
  --   disallow_partial_matching = true,
  --   disallow_prefix_unmatching = false,
  -- },
  matching = {
    disallow_fuzzy_matching = false,
    disallow_fullfuzzy_matching = false,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = false,
  },
  -- Thanks to https://www.youtube.com/@yukiuthman8358
  sorting = {
    priority_weight = 0.8,
    comparators = {
      -- compare.score_offset, -- not good at all
      -- compare.scopes, -- treesitter scope
      compare.locality,
      -- compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      function(entry1, entry2)
        local kind1 = entry1.completion_item.kind
        local kind2 = entry2.completion_item.kind

        local node = ts_utils.get_node_at_cursor()

        if node and node:type() == "arguments" then
          if kind1 == 22 then
            entry1.score = 100
          end

          if kind2 == 22 then
            entry2.score = 100
          end
        end

        local diff = entry2.score - entry1.score
        if diff < 0 then
          return true
        elseif diff > 0 then
          return false
        end
      end,
      compare.offset,
      compare.recently_used,
      function(...)
        return cmp_buffer:compare_locality(...)
      end,
      compare.order,
      -- compare.scopes, -- what?
      -- compare.sort_text,
      -- compare.exact,
      -- compare.kind,
      -- compare.length,
    },
  },
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
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
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "emoji" },
    { name = "nerdfont" },
    {
      name = "codeium",
      keyword_length = 5,
    },
    {
      name = "cmp_tabnine",
      keyword_length = 5,
    },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
        indexing_batch_size = 100,
        indexing_batch_size = 150,
      },
      keyword_length = 5,
    },
    {
      name = "rg",
      keyword_length = 5,
    },
    {
      name = "tmux",
      option = {
        all_panes = true,
      },
    },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = {
        Codeium = "",
        TabNine = "",
      },
    }),
  },
  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" and not vim.bo.buftype == "prompt" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,

  experimental = {
    ghost_text = true,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
})

---@diagnostics enable

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
