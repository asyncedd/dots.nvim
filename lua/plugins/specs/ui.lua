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
      },
    },
    name = "catppuccin",
  },
  {
    "rcarriga/nvim-notify",
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
      local M = {}
      local U = require("core.utils.colors")
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")
      local Normal = string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true)["foreground"], 0.3) or 0
      local Align = { provider = "%=" }
      local Space = { provider = " " }

      M.colors = {
        bright_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.7),
        brighter_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.5),
        Normal = utils.get_highlight("Normal").bg,
        bright_fg = utils.get_highlight("Folded").fg,
        red = utils.get_highlight("DiagnosticError").fg,
        dark_red = utils.get_highlight("DiffDelete").bg,
        green = utils.get_highlight("String").fg,
        blue = utils.get_highlight("Function").fg,
        gray = utils.get_highlight("NonText").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        cyan = utils.get_highlight("Special").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
        git_del = utils.get_highlight("diffRemoved").fg,
        git_add = utils.get_highlight("diffAdded").fg,
        git_change = utils.get_highlight("diffChanged").fg,
      }

      M.ViMode = {
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
          mode_names = { -- change the strings if you like it vvvvverbose!
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
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
          provider = "",
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = self.mode_colors[mode], bold = true }
          end,

          update = {
            "ModeChanged",
            pattern = "*:*",
            callback = vim.schedule_wrap(function()
              vim.cmd("redrawstatus")
            end),
          },
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
            callback = vim.schedule_wrap(function()
              vim.cmd("redrawstatus")
            end),
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
          provider = function(self)
            return "%2(" .. self.mode_names[self.mode] .. "%)"
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
            callback = vim.schedule_wrap(function()
              vim.cmd("redrawstatus")
            end),
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
            callback = vim.schedule_wrap(function()
              vim.cmd("redrawstatus")
            end),
          },
        },
      }

      M.FileNameBlock = {
        -- let's first set up some attributes needed by this component and it's children
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
          local filename = self.filename
          local extension = vim.fn.fnamemodify(filename, ":e")
          self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        end,
      }
      -- We can now define some children separately and add them later

      M.FileIcon = {
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

      M.FileName = {
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

      -- let's add the children to our FileNameBlock component
      M.FileNameBlock = utils.insert(
        M.FileNameBlock,
        M.FileIcon,
        { Space, hl = { bg = "bright_bg" } },
        utils.insert(M.FileName), -- a new table where FileName is a child of FileNameModifier
        { provider = "%<" }, -- this means that the statusline is cut here when there's not enough space
        {
          provider = "",
          hl = function()
            return { fg = "bright_bg", bold = true }
          end,
        }
      )

      M.Git = {
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

      M.Diagnostics = {

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

      M.LSPActive = {
        condition = conditions.lsp_attached,
        update = { "LspAttach", "LspDetach" },

        {
          provider = "",
          hl = { fg = "green" },
        },
        {
          provider = " ",
          hl = { bg = "green", fg = "Normal" },
        },
        {
          provider = function()
            local names = {}
            for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
              table.insert(names, server.name)
            end
            return " " .. table.concat(names, " ")
          end,
          hl = { fg = "green", bg = "bright_bg", bold = true },
        },
        {
          provider = "",
          hl = { fg = "bright_bg" },
        },
      }

      M.WorkDir = {
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

      M.Scrollbar = {
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

      M.StatusLine = {
        M.ViMode,
        Space,
        M.FileNameBlock,
        Space,
        M.Git,
        Align,
        M.Diagnostics,
        Space,
        M.LSPActive,
        Space,
        M.WorkDir,
        Space,
        M.Scrollbar,
      }

      M.StatusLines = {
        static = {
          mode_colors_map = {
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
          mode_color = function(self)
            local mode = conditions.is_active() and vim.fn.mode() or "n"
            return self.mode_colors_map[mode]
          end,
          icon_color = function(self)
            local filename = self.filename
            local extension = vim.fn.fnamemodify(filename, ":e")
            local _, icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

            return icon_color
          end,
        },
        hl = function()
          if conditions.is_active() then
            return "Normal"
          else
            return "Normal"
          end
        end,

        M.StatusLine,
      }

      return {
        opts = {
          colors = M.colors,
        },
        statusline = M.StatusLines,
      }
    end,
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
}
