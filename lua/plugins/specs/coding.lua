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
        pattern = "LazyFile",
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

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "crates" },
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
            vim_item.menu = "(" .. item .. ")"

            return vim_item
          end,
        },
        experimental = {
          ghost_text = true,
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
