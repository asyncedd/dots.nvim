local sources = dots.coding.cmp.sources
local ret = {}

for i, _ in ipairs(sources) do
  table.insert(ret, sources[i].source)
end

return not dots.coding.enabled and {}
  or {
    {
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          local luasnip = require("luasnip")
          local cmp = require("cmp")
          local kind_icons = dots.UI.icons
          local s = {}
          for i, _ in ipairs(sources) do
            table.insert(s, { name = sources[i].name, priority = sources[i].priority or nil })
          end

          return {
            snippet = {
              expand = dots.coding.cmp.snippet or function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            sources = s,
            mapping = cmp.mapping.preset.insert({
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
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            formatting = {
              fields = { "abbr", "kind", "menu" },
              format = function(entry, vim_item)
                local item = vim_item.kind
                vim_item = require("cmp-tailwind-colors").format(entry, vim_item)
                vim_item.kind = string.format("%s %s", kind_icons[item], item)
                vim_item.kind = " " .. vim_item.kind .. " "

                return vim_item
              end,
            },
            experimental = {
              ghost_text = dots.coding.cmp.ghost_text,
            },
          }
        end,
        event = "InsertEnter",
        dependencies = { ret, "js-everts/cmp-tailwind-colors" },
        enabled = dots.coding.cmp.enabled,
      },
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

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
        })
      end,
      event = "CmdlineEnter",
      enabld = dots.coding.cmp.cmd,
    },
    {
      {
        "L3MON4D3/LuaSnip",
        opts = {},
        dependencies = {
          dots.coding.luasnip.snippets.friendly_snippets and "rafamadriz/friendly-snippets",
        },
        config = function(_, opts)
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip").setup(opts)
        end,
        enabled = dots.coding.luasnip.enabled,
      },
    },
    {
      "altermo/ultimate-autopair.nvim",
      opts = {
        space2 = {
          enable = true,
          multi = true,
        },
        bs = {
          indent_ignore = true,
        },
      },
      event = "InsertEnter",
      enabled = dots.coding.ultimate_autopairs,
    },
    {
      "numToStr/Comment.nvim",
      opts = true,
      event = "VeryLazy",
      enabled = dots.coding.comment.enabled,
    },
  }
