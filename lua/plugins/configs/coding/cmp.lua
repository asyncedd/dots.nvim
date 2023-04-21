local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
  CmpItemAbbrMatch = { fg = colors.pink, style = { "bold" } },
  CmpItemAbbrMatchFuzzy = { fg = colors.pink, style = { "bold" } },
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local compare = require("cmp.config.compare")
local cmp_buffer = require("cmp_buffer")
local ts_utils = require("nvim-treesitter.ts_utils")
-- local types = require("cmp.types")
-- local cache = require("cmp.utils.cache")

-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

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
  sorting = {
    priority_weight = 0.8,
    comparators = {
      -- compare.score_offset, -- not good at all
      -- compare.scopes, -- treesitter scope
      function(entry1, entry2)
        setmetatable({
          scopes_map = {},
          update = function(self)
            local config = require("cmp").get_config()
            if not vim.tbl_contains(config.sorting.comparators, compare.scopes) then
              return
            end

            local ok, locals = pcall(require, "nvim-treesitter.locals")
            if ok then
              local win, buf = vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
              local cursor_row = vim.api.nvim_win_get_cursor(win)[1] - 1

              -- Cursor scope.
              local cursor_scope = nil
              for _, scope in ipairs(locals.get_scopes(buf)) do
                if scope:start() <= cursor_row and cursor_row <= scope:end_() then
                  if not cursor_scope then
                    cursor_scope = scope
                  else
                    if cursor_scope:start() <= scope:start() and scope:end_() <= cursor_scope:end_() then
                      cursor_scope = scope
                    end
                  end
                elseif cursor_scope and cursor_scope:end_() <= scope:start() then
                  break
                end
              end

              -- Definitions.
              local definitions = locals.get_definitions_lookup_table(buf)

              -- Narrow definitions.
              local depth = 0
              for scope in locals.iter_scope_tree(cursor_scope, buf) do
                local s, e = scope:start(), scope:end_()

                -- Check scope's direct child.
                for _, definition in pairs(definitions) do
                  if s <= definition.node:start() and definition.node:end_() <= e then
                    if scope:id() == locals.containing_scope(definition.node, buf):id() then
                      local text = vim.treesitter.query.get_node_text(definition.node, buf) or ""
                      if not self.scopes_map[text] then
                        self.scopes_map[text] = depth
                      end
                    end
                  end
                end
                depth = depth + 1
              end
            end
          end,
        }, {
          __call = function(self, entry1, entry2)
            local local1 = self.scopes_map[entry1:get_word()]
            local local2 = self.scopes_map[entry2:get_word()]
            if local1 ~= local2 then
              if local1 == nil then
                return false
              end
              if local2 == nil then
                return true
              end
              return local1 < local2
            end
          end,
        })
      end,
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
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "emoji" },
    { name = "nerdfont" },
    -- {
    --   name = "codeium",
    --   keyword_length = 5,
    -- },
    -- {
    --   name = "cmp_tabnine",
    --   keyword_length = 5,
    -- },
    {
      name = "treesitter",
      keyword_length = 5,
    },
    {
      name = "buffer",
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
    -- fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        mode = "symbol_text", -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        symbol_map = {
          Codeium = "",
          TabNine = "",
          rg = "",
        },
      })(entry, vim_item)

      local strings = vim.split(vim_item.kind, "%s+", { trimempty = true })
      kind.kind = string.format(" [%s] %s ", strings[1], strings[2])
      return kind
    end,
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

  window = {
    completion = {
      border = "rounded",
      --[[ Default: ]]
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      -- winhighlight = "CursorLine:PmenuSel,Search:None",
      col_offset = 0,
      side_padding = 0,
    },
    documentation = {
      border = "rounded",
      -- Default: winhighlight = "FloatBorder:NormalFloat",
      winhighlight = "FloatBorder:FloatBorder",
      zindex = 1001,
    },
  },

  -- view = {
  --   entries = {
  --     name = "custom",
  --     selection_order = "near_cursor",
  --   },
  -- },

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

