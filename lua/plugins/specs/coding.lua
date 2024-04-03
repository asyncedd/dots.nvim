return {
  {
    "altermo/ultimate-autopair.nvim",
    opts = {
      bs = {
        indent_ignore = true,
      },
    },
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = {
        "html",
        "xml",
        "svelte",
      },
    },
    init = function()
      local function stringExistsInArray(array, searchString)
        for _, value in ipairs(array) do
          if value == searchString then
            return true
          end
        end
        return false
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "FilePost",
        callback = function()
          local plugin = require("lazy.core.config").plugins["nvim-ts-autotag"]
          if stringExistsInArray(require("lazy.core.plugin").values(plugin, "opts", false), vim.bo.filetype) then
            if not plugin._.loaded then
              require("lazy").load({ plugins = "nvim-ts-autotag" })
            end
          end
        end,
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "fivethree-team/vscode-svelte-snippets",
    },
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local function entry_has_key(entry, key)
        if not entry.completion_item then
          return
        end
        if entry.completion_item.textEdit then
          return entry.completion_item.textEdit.newText:find(key, 1, true)
        end
        if entry.completion_item.insertText then
          return entry.completion_item.insertText:find(key, 1, true)
        end
      end
      local function fast_cmp_visible()
        -- NOTE: cmp:visible() is quite slow, and we use it on a fairly
        -- hot path. This hack reaches in to speed up the check
        if not (cmp.core.view and cmp.core.view.custom_entries_view) then
          return false
        end
        return cmp.core.view.custom_entries_view:visible()
      end
      local function try_accept_completion(key_or_config)
        local key = key_or_config
        local cmdwin = nil
        if type(key_or_config) == "table" then
          key = key_or_config.key
          cmdwin = key_or_config.cmdwin
        end

        return cmp.mapping(function(fallback)
          if fast_cmp_visible() and cmp.get_active_entry() then
            local entry = cmp.get_active_entry()

            cmp.confirm()

            if key and not entry_has_key(entry, key) then
              vim.api.nvim_feedkeys(key, "nt", false)
            end
          elseif cmdwin and vim.fn.getcmdwintype() ~= "" then
            local to_feed = vim.api.nvim_replace_termcodes(cmdwin, true, false, true)
            vim.api.nvim_feedkeys(to_feed, "nt", true)
          else
            fallback()
          end
        end, { "i", "c" })
      end
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        performance = {
          max_view_entries = 20,
          debounce = 150,
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "crates" },
          -- https://github.com/hrsh7th/cmp-buffer
          {
            name = "buffer",
            keyword_length = 4,
            max_item_count = 10,
            option = {
              get_bufnrs = function()
                local buf = vim.api.nvim_get_current_buf()
                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                if byte_size > 1024 * 1024 then -- 1 Megabyte max
                  return {}
                end
                return { buf }
              end,
              indexing_interval = 1000,
            },
          },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if fast_cmp_visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if fast_cmp_visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<Space>"] = try_accept_completion(" "),
          ["("] = try_accept_completion("("),
          ["."] = try_accept_completion("."),
          -- NOTE: The enter key is a bit special here; if we use the normal fallback
          -- from the cmdline window, we will end up performing a bunch of edits due to
          -- the fallback mappings from endwise (which would run *after* the cmdline
          -- window gets closed)
          ["<CR>"] = try_accept_completion({ cmdwin = "<CR>" }),
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(_, vim_item)
            local item = vim_item.kind
            vim_item.kind = dots.UI.icons.LSP.kind[item]

            return vim_item
          end,
        },
        experimental = {
          ghost_text = true,
        },
        view = {
          entries = {
            follow_cursor = true,
          },
        },
      }
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    cmd = "CmpStatus",
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    event = "CmdlineEnter",
  },
}
