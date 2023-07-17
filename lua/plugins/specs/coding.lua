return not dots.coding.enabled and {} or {
  dots.coding.cmp.enabled and {
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local luasnip = require("luasnip")
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
