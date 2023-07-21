return {
  {
    "catppuccin/nvim",
    opts = {
      custom_highlights = function(C)
        return {
          ["@variable"] = { fg = C.flamingo },
          Pmenu = { bg = C.mantle },
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
        require("lazy").load({ plugins = "nvim-notify" })
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
      local U = require("core.utils.colors")
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")
      local Normal = string.format("#%06x", utils.get_highlight("Normal").fg)
      local Align = { provider = "%=" }
      local Space = { provider = " " }

      local colors = {
        bright_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.7),
        brighter_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.5),
        Normal = utils.get_highlight("Normal").bg,
        red = utils.get_highlight("DiagnosticError").fg,
        green = utils.get_highlight("String").fg,
        blue = utils.get_highlight("Function").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        yellow = utils.get_highlight("DiagnosticWarn").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
      }

      local ViMode = {
        -- get vim current mode, this information will be required by the provider
        -- and the highlight functions, so we compute it only once per component
        -- evaluation and store it as a component attribute
        init = function(self)
          self.mode = vim.fn.mode(1) -- :h mode()
        end,
        -- Now we define some dictionaries to map the output of mode() to the
        -- corresponding string and color. We can put these into `static` to compute
        -- them at initialisation time.
        static = {
          mode_names = {
            n = "NORMAL",
            no = "NORMAL",
            nov = "NORMAL",
            noV = "NORMAL",
            ["no\22"] = "NORMAL",
            niI = "NORMAL",
            niR = "NORMAL",
            niV = "NORMAL",
            nt = "NORMAL",
            v = "VISUAL",
            vs = "VISUAL",
            V = "VISUAL",
            Vs = "VISUAL",
            ["\22"] = "VISUAL",
            ["\22s"] = "VISUAL",
            s = "SELECT",
            S = "SELECT",
            ["\19"] = "SELECT",
            i = "INSERT",
            ic = "INSERT",
            ix = "INSERT",
            R = "REPLACE",
            Rc = "REPLACE",
            Rx = "REPLACE",
            Rv = "REPLACE",
            Rvc = "REPLACE",
            Rvx = "REPLACE",
            c = "COMMAND",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "TERM",
          },
          mode_colors = {
            n = "blue",
            i = "green",
            v = "pink",
            V = "pink",
            ["\22"] = "pink",
            c = "yellow",
            s = "purple",
            S = "purple",
            ["\19"] = "purple",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "green",
          },
        },
        -- We can now access the value of mode() that, by now, would have been
        -- computed by `init()` and use it to index our strings dictionary.
        -- note how `static` fields become just regular attributes once the
        -- component is instantiated.
        -- To be extra meticulous, we can also add some vim statusline syntax to
        -- control the padding and make sure our string is always at least 2
        -- characters long. Plus a nice Icon.
        {
          {
            provider = "",
            hl = function(self)
              local mode = self.mode:sub(1, 1)
              return { fg = self.mode_colors[mode], bold = true }
            end,
          },
          {
            provider = " ",
            -- Same goes for the highlight. Now the foreground will change according to the current mode.
            hl = function(self)
              local mode = self.mode:sub(1, 1) -- get only the first mode character
              return { bg = self.mode_colors[mode], fg = "Normal", bold = true }
            end,

            update = {
              "ModeChanged",
              pattern = "*:*",
            },
          },
          update = {
            "ModeChanged",
            pattern = "*:*",
          },
        },
        {
          condition = function()
            return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
          end,
          provider = "  ",
          hl = { fg = "orange", bg = "bright_bg", bold = true },
          utils.surround({ "[", "]" }, nil, {
            provider = function()
              return vim.fn.reg_recording()
            end,
            hl = { fg = "green", bg = "bright_bg", bold = true },
          }),
          update = {
            "RecordingEnter",
            "RecordingLeave",
          },
        },
        {
          {
            provider = function(self)
              return " %2(" .. self.mode_names[self.mode] .. "%)"
            end,
            hl = function(self)
              local mode = self.mode:sub(1, 1)
              return {
                fg = self.mode_colors[mode],
                bg = "bright_bg",
                bold = true,
              }
            end,
            update = {
              "ModeChanged",
              pattern = "*:*",
            },
          },
          {
            provider = "",
            hl = function()
              return { fg = "bright_bg", bold = true }
            end,
            update = {
              "ModeChanged",
              pattern = "*:*",
            },
          },
          update = {
            "ModeChanged",
            pattern = "*:*",
          },
        },
      }

      local FileIcon = {
        {
          provider = "",
          hl = function(self)
            return { fg = self.icon_color }
          end,
        },
        {
          provider = function(self)
            return self.icon and (self.icon .. " ")
          end,
          hl = function(self)
            return { bg = self.icon_color, fg = "Normal" }
          end,
        },
      }

      local FileName = {
        provider = function(self)
          -- first, trim the pattern relative to the current directory. For other
          -- options, see :h filename-modifers
          local filename = vim.fn.fnamemodify(self.filename, ":t")
          if filename == "" then
            return "[No Name]"
          end
          -- now, if the filename would occupy more than 1/4th of the available
          -- space, we trim the file path to its initials
          -- See Flexible Components section below for dynamic truncation
          if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
          end
          return filename
        end,
        hl = function(self)
          return { fg = self.icon_color, bg = "bright_bg" }
        end,
      }

      local FileFlags = {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "orange" },
      }

      -- let's add the children to our FileNameBlock component
      local FileNameBlock = {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
          local filename = self.filename
          local extension = vim.fn.fnamemodify(filename, ":e")
          self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        end,

        FileIcon,
        { Space, hl = { bg = "bright_bg" } },
        utils.insert(FileName, FileFlags),
        { provider = "%<" },
        {
          provider = "",
          hl = function()
            return { fg = "bright_bg", bold = true }
          end,
        },
      }

      local Git = {
        condition = conditions.is_git_repo,

        init = function(self)
          self.status_dict = vim.b.gitsigns_status_dict
          self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
        end,

        hl = { fg = "orange" },

        { -- git branch name
          provider = function(self)
            return " " .. self.status_dict.head .. " "
          end,
          hl = { bold = true },
        },
        {
          provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and (dots.UI.icons.Git.add .. " " .. count .. " ")
          end,
          hl = { fg = "brighter_bg" },
        },
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (dots.UI.icons.Git.del .. " " .. count .. " ")
          end,
          hl = { fg = "brighter_bg" },
        },
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (dots.UI.icons.Git.mod .. " " .. count .. " ")
          end,
          hl = { fg = "brighter_bg" },
        },
      }

      local Diagnostics = {

        condition = conditions.has_diagnostics,

        static = {
          error_icon = dots.UI.icons.LSP.Error,
          warn_icon = dots.UI.icons.LSP.Warn,
          info_icon = dots.UI.icons.LSP.Info,
          hint_icon = dots.UI.icons.LSP.Hint,
        },

        init = function(self)
          self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
          self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
          self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,

        update = { "DiagnosticChanged", "BufEnter" },

        {
          provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
          end,
          hl = { fg = "diag_error" },
        },
        {
          provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
          end,
          hl = { fg = "diag_warn" },
        },
        {
          provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
          end,
          hl = { fg = "diag_info" },
        },
        {
          provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
          end,
          hl = { fg = "diag_hint" },
        },
      }

      local lsp_attached = function()
        return next(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) ~= nil
      end

      local LSPActive = {
        init = function(self)
          self.lsp_attached = lsp_attached()
        end,
        update = { "LspAttach", "LspDetach" },

        {
          provider = function(self)
            return self.lsp_attached and "" or ""
          end,
          hl = { fg = "green" },
        },
        {
          provider = function(self)
            return self.lsp_attached and " " or ""
          end,
          hl = { bg = "green", fg = "Normal" },
        },
        {
          provider = function(self)
            if rawget(vim, "lsp") then
              local names = {}
              for _, server in pairs(vim.lsp.get_clients()) do
                if server.attached_buffers[vim.api.nvim_get_current_buf()] then
                  table.insert(names, server.name)
                end
              end
              return self.lsp_attached and " " .. table.concat(names, " ") or ""
            end
          end,
          hl = { fg = "green", bg = "bright_bg", bold = true },
        },
        {
          provider = function(self)
            return self.lsp_attached and "" or ""
          end,
          hl = { fg = "bright_bg" },
        },
      }

      local WorkDir = {
        {
          provider = "",
          hl = { fg = "blue" },
        },
        {
          provider = " ",
          hl = { fg = "Normal", bg = "blue" },
        },
        {
          provider = function()
            local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return " " .. dir
          end,
          hl = { fg = "blue", bg = "bright_bg", bold = true },
        },
        {
          provider = "",
          hl = { fg = "bright_bg" },
        },
      }

      local Scrollbar = {
        {
          provider = "",
          hl = { fg = "purple" },
        },
        {
          provider = " ",
          hl = { bg = "purple", fg = "Normal" },
        },
        {
          provider = " %l/%c",
          hl = { bg = "bright_bg" },
        },
        {
          provider = "",
          hl = { fg = "bright_bg" },
        },
      }

      local StatusLine = {
        ViMode,
        Space,
        FileNameBlock,
        Space,
        Git,
        Align,
        Diagnostics,
        Space,
        LSPActive,
        Space,
        WorkDir,
        Space,
        Scrollbar,
      }

      local StatusLines = {
        hl = "Normal",

        StatusLine,
      }

      return {
        opts = {
          colors = colors,
        },
        statusline = StatusLines,
      }
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
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
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
    "luukvbaal/statuscol.nvim",
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { " " } },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      }
    end,
    event = "UIEnter",
  },
}
