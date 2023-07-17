return not dots.coding.enabled and {} or {
  dots.coding.cmp.enabled and {
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local kind_icons = dots.UI.icons

        return {
          snippet = {
            expand = dots.coding.cmp.snippet or function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          sources = {
            dots.coding.cmp.sources.luasnip and { name = "luasnip" },
            dots.coding.cmp.sources.buffer and { name = "buffer" },
            dots.coding.cmp.sources.path and { name = "path" },
            dots.coding.cmp.sources.lsp and { name = "nvim_lsp" },
          },
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
            format = function(_, vim_item)
              local item = vim_item.kind
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
      dependencies = {
        dots.coding.cmp.sources.luasnip and "saadparwaiz1/cmp_luasnip",
        dots.coding.cmp.sources.buffer and "hrsh7th/cmp-buffer",
        dots.coding.cmp.sources.path and "hrsh7th/cmp-path",
        dots.coding.cmp.sources.lsp and "hrsh7th/cmp-nvim-lsp",
      },
    },
    dots.coding.cmp.specs,
  },
  dots.coding.luasnip.enabled and {
    {
      "L3MON4D3/LuaSnip",
    },
    dots.coding.luasnip.enabled and dots.coding.luasnip.specs,
  },
}
