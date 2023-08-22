local sources = dots.coding.cmp.sources
local ret = {}

for i, _ in ipairs(sources) do
  table.insert(ret, sources[i].source or nil)
end

return not dots.coding.enabled and {}
  or {
    {
      {
        "hrsh7th/nvim-cmp",
        opts = function()
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
              fields = { "kind", "abbr", "menu" },
              format = function(entry, vim_item)
                local item = vim_item.kind
                vim_item = require("cmp-tailwind-colors").format(entry, vim_item)
                vim_item.kind = kind_icons[item]
                vim_item.menu = "(" .. item .. ")"

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
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        config = function(_, opts)
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip").setup(opts)
        end,
      },
    },
    {
      "altermo/ultimate-autopair.nvim",
      opts = {
        space2 = {
          enable = true,
        },
        bs = {
          indent_ignore = true,
        },
      },
      event = { "InsertEnter", "CmdlineEnter" },
      enabled = dots.coding.ultimate_autopairs,
    },
    {
      "numToStr/Comment.nvim",
      opts = function()
        return {
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
      end,
      event = "VeryLazy",
      dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    },
    {
      "monaqa/dial.nvim",
      opts = function()
        local augend = require("dial.augend")
        return {
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%Y/%m/%d"],
            augend.constant.new({
              elements = {
                "true",
                "false",
              },
              word = true,
              cyclic = true,
            }),
          },
          lua = {
            augend.constant.new({
              elements = { "and", "or" },
              word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
              cyclic = true, -- "or" is incremented into "and".
            }),
          },
        }
      end,
      config = function(_, opts)
        local function exists_ft()
          local ft = vim.bo.filetype
          return opts[ft] and ft or "default"
        end

        local function register_dial_group()
          local dials = {}

          for key, value in pairs(opts) do
            dials[key] = key ~= "default" and { unpack(opts.default) } or {}
            for _, name in ipairs(value) do
              table.insert(dials[key], name)
            end
          end

          require("dial.config").augends:register_group(dials)
        end

        local function create_keymaps()
          local map = vim.api.nvim_buf_set_keymap
          local dial_map = require("dial.map")

          local function set_keymap(mode, lhs, rhs)
            map(0, mode, lhs, dial_map[rhs](exists_ft()), { noremap = true })
          end

          set_keymap("n", "<C-a>", "inc_normal")
          set_keymap("n", "<C-x>", "dec_normal")
          set_keymap("n", "g<C-a>", "inc_gnormal")
          set_keymap("n", "g<C-x>", "dec_gnormal")
          set_keymap("v", "<C-a>", "inc_visual")
          set_keymap("v", "<C-x>", "dec_visual")
          set_keymap("v", "g<C-a>", "inc_gvisual")
          set_keymap("v", "g<C-x>", "dec_gvisual")
        end

        register_dial_group()
        create_keymaps()

        vim.api.nvim_create_autocmd("FileType", {
          callback = create_keymaps,
        })
      end,
      keys = {
        { "<C-a>", desc = "Increment" },
        { "<C-x>", desc = "Decrement" },
        { "g<C-a>", desc = "gIncrement" },
        { "g<C-x>", desc = "gDecrement" },
        { "<C-a>", desc = "Increment", mode = "v" },
        { "<C-x>", desc = "Decrement", mode = "v" },
        { "g<C-a>", desc = "gIncrement", mode = "v" },
        { "g<C-x>", desc = "gDecrement", mode = "v" },
      },
    },
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
        max_join_length = 69420,
      },
      keys = {
        {
          "gS",
          function()
            require("treesj").toggle()
          end,
        },
      },
    },
    {
      "windwp/nvim-ts-autotag",
      opts = {
        filetypes = dots.coding.autotag.ft,
      },
      init = function()
        vim.api.nvim_create_autocmd("BufReadPost", {
          callback = function()
            local function hasValueInArray(array, value)
              for _, v in ipairs(array) do
                if v == value then
                  return true
                end
              end
              return false
            end

            if hasValueInArray(dots.coding.autotag.ft, vim.bo.filetype) then
              vim.schedule(function()
                require("lazy").load({
                  plugins = "nvim-ts-autotag",
                })
              end)
            end
          end,
        })
      end,
    },
  }
