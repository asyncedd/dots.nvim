return {
  {
    "catppuccin/nvim",
    opts = {
      custom_highlights = function(C)
        return {
          Pmenu = { bg = C.mantle },
          PmenuSel = { bg = C.blue, fg = C.base, style = { "bold" } },
          CmpItemKindCodeium = { fg = C.green },
          CmpItemMenu = { fg = C.overlay0 },
          MatchParen = { fg = C.peach, bg = C.none, style = { "bold" } },

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
        notify = true,
        mini = true,
        flash = true,
        barbecue = false,
        dashboard = false,
        alpha = false,
        nvimtree = false,
        ts_rainbow2 = false,
        ts_rainbow = false,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
    name = "catppuccin",
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, C)
        hl.CmpItemKindCodeium = { fg = C.green }

        hl.TelescopeBorder = { fg = C.bg_dark, bg = C.bg_dark }
        hl.TelescopeMatching = { fg = C.blue }
        hl.TelescopeNormal = { bg = C.bg_dark }
        hl.TelescopePromptBorder = { fg = C.comment, bg = C.comment }
        hl.TelescopePromptNormal = { fg = C.bg_dark, bg = C.comment }
        hl.TelescopePromptPrefix = { fg = C.magenta }
        hl.TelescopePreviewTitle = { fg = C.bg_dark, bg = C.green }
        hl.TelescopePromptTitle = { fg = C.bg_dark, bg = C.red }
        hl.TelescopeResultsTitle = { fg = C.bg_dark, bg = C.purple }
        hl.TelescopeSelection = { fg = C.fg, bg = C.comment }
        hl.TelescopeSelectionCaret = { fg = C.purple }
      end,
    },
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
      }
    end,
    event = "VeryLazy",
  },
}
