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
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
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
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
