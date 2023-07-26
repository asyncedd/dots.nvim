return {
  {
    "catppuccin/nvim",
    opts = {
      custom_highlights = function(C)
        return {
          Pmenu = { bg = C.mantle },
          PmenuSel = { bg = C.blue, fg = C.base, style = { "bold" } },
          CmpItemKindCodeium = { fg = C.green },

          DiagnosticVirtualTextError = {
            fg = C.red,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextWarn = {
            fg = C.yellow,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextInfo = {
            fg = C.sky,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextHint = {
            fg = C.teal,
            bg = C.none,
            style = { "italic" },
          },
        }
      end,
      integrations = {
        telescope = { style = "nvchad" },
        illuminate = true,
        notify = true,
        mini = true,
      },
    },
    name = "catppuccin",
  },
  {
    "rcarriga/nvim-notify",
    opts = function()
      local api = vim.api
      local stages = require("notify.stages.fade_in_slide_out")("top_down")
      local base = require("notify.render.base")
      return {
        render = function(bufnr, notif, highlights, config)
          local max_message_width = math.max(math.max(unpack(vim.tbl_map(function(line)
            return vim.fn.strchars(line)
          end, notif.message))))
          local title = notif.title[1]
          local title_accum = vim.str_utfindex(title)

          local title_buffer =
            string.rep(" ", (math.max(max_message_width, title_accum, config.minimum_width()) - title_accum) / 2)

          local namespace = base.namespace()

          api.nvim_buf_set_lines(bufnr, 0, 1, false, { "", "" })
          api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
            virt_text = {
              { title_buffer .. notif.icon .. " " .. title .. title_buffer, highlights.title },
            },
            virt_text_win_col = 0,
            priority = 10,
          })
          api.nvim_buf_set_extmark(bufnr, namespace, 1, 0, {
            virt_text = {
              {
                string.rep("━", math.max(max_message_width, title_accum, config.minimum_width())),
                highlights.border,
              },
            },
            virt_text_win_col = 0,
            priority = 10,
          })
          api.nvim_buf_set_lines(bufnr, 2, -1, false, notif.message)

          api.nvim_buf_set_extmark(bufnr, namespace, 2, 0, {
            hl_group = highlights.body,
            end_line = 1 + #notif.message,
            end_col = #notif.message[#notif.message],
            priority = 50,
          })
        end,
        stages = {
          function(...)
            local opts = stages[1](...)
            if opts then
              opts.row = opts.row + 1
            end
            return opts
          end,
          unpack(stages, 2),
        },
        fps = 60,
      }
    end,
    init = function()
      vim.notify = function(...)
        if not require("lazy.core.config").plugins["nvim-notify"]._.loaded then
          require("lazy").load({ plugins = "nvim-notify" })
        end
        require("notify")(...)
      end
    end,
    enabled = dots.UI.notify.enabled,
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
      },
    },
    event = "VeryLazy",
    enabled = dots.UI.noice.enabled,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    event = "UIEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indentLine_enabled = 1,
      filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "lazyterm",
        "toggleterm",
        "noice",
        "",
      },
      buftype_exclude = { "terminal" },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "lazyterm",
          "toggleterm",
          "noice",
          "python",
          "undotree",
          "norg",
          "",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    event = "VeryLazy",
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = false,
        enforce_regular_tabs = true,
      },
    },
    event = "VeryLazy",
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
      require("colorizer").attach_to_buffer()
    end,
    event = "VeryLazy",
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        border = "solid",
      },
      nui = {
        border = "solid",
      },
      builtin = {
        border = "solid",
      },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.animate",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          enable = false,
        },
        scroll = {
          timing = animate.gen_timing.exponential({ duration = 50, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1 and total_scroll < 50
            end,
          }),
        },
        cursor = {
          timing = function(_, n)
            return 150 / n
          end,
        },
        open = {
          winconfig = animate.gen_winconfig.wipe({
            direction = "from_edge",
          }),
        },
        close = {
          winconfig = animate.gen_winconfig.wipe({
            direction = "to_edge",
          }),
        },
      }
    end,
    event = "VeryLazy",
  },
}
