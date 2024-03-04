local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local Align = { provider = "%=" }
local Space = { provider = " " }

local mode_colors = {
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
}

local colors = function()
  return {
    gray = utils.get_highlight("LineNr").fg,
    cursorline = utils.get_highlight("CursorLineNr").fg,
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
    git_del = utils.get_highlight("diffDeleted").fg or utils.get_highlight("diffRemoved").fg,
    git_add = utils.get_highlight("diffAdded").fg,
    git_change = utils.get_highlight("diffChanged").fg,
  }
end

local ViMode = {
  init = function(self)
    local mode = conditions.is_active() and vim.fn.mode() or "n"
    self.mode_color = mode_colors[mode]
  end,
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
  },
  {
    provider = function(self)
      return "  %2(" .. self.mode_names[vim.fn.mode(1)] .. "%) "
    end,
    hl = function(self)
      local color = self.mode_color
      return { bg = color, fg = "Normal", bold = true }
    end,
  },
  {
    provider = "",
    hl = function(self)
      local color = self.mode_color
      return { fg = color, bg = "gray", bold = true }
    end,
  },
  {
    provider = "",
    hl = { fg = "gray", bold = true },
  },
}
local MacroRec = {
  condition = function()
    return vim.fn.reg_recording() ~= ""
  end,
  {
    provider = "  " .. vim.fn.reg_recording(),
    hl = { fg = "orange", bold = true },
  },
  {
    provider = function()
      return vim.fn.reg_recording()
    end,
    hl = { fg = "green", bold = true },
  },
  update = {
    "RecordingEnter",
    "RecordingLeave",
  },
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":t")
    if filename == "" then
      return "Scratch"
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = dots.UI.icons.buffers.modified,
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = dots.UI.icons.buffers.readonly,
    hl = { fg = "orange" },
  },
  {
    condition = function()
      local buffers = vim.api.nvim_list_bufs()
      if not (buffers == 1) then
        for _, buf in pairs(buffers) do
          if vim.api.nvim_get_current_buf() == buf then
            goto continue
          end
          if vim.api.nvim_buf_get_option(buf, "modified") then
            return true
          end
          ::continue::
        end
      end

      return false
    end,
    provider = dots.UI.icons.buffers.unsaved_others,
    hl = { fg = "blue" },
  },
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  FileIcon,
  FileName,
  Space,
  FileFlags,
  { provider = "%<" },
}

local WorkDir = {
  {
    provider = "",
    hl = { fg = "blue" },
  },
  {
    provider = "󰉋 ",
    hl = { bg = "blue", fg = "Normal" },
  },
  Space,
  {
    provider = function()
      local cwd = vim.fn.getcwd(0)
      cwd = vim.fn.fnamemodify(cwd, ":t:r")
      if not conditions.width_percent_below(#cwd, 0.25) then
        cwd = vim.fn.pathshorten(cwd)
      end
      return cwd .. " "
    end,
    hl = { fg = "blue", bold = true },
  },
}
local cursor_position = {
  {
    provider = "",
    hl = { fg = "red" },
  },
  {
    provider = " ",
    hl = { bg = "red", fg = "Normal" },
  },
  Space,
  {
    provider = "%l/%c ",
    hl = { fg = "blue", bold = true },
  },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  update = {
    "User",
    pattern = "GitSignsUpdate",
  },

  hl = { fg = "gray" },

  {
    provider = function(self)
      return "󰊤 " .. self.status_dict.head .. " "
    end,
    hl = { bold = true },
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (dots.UI.icons.Git.added .. count .. " ")
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (dots.UI.icons.Git.remove .. count .. " ")
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (dots.UI.icons.Git.changed .. count .. " ")
    end,
  },
}

local Diagnostics = {
  condition = function()
    return #vim.diagnostic.get(0) > 0
  end,
  static = {
    error_icon = dots.UI.icons.LSP.diagnostics.Error,
    warn_icon = dots.UI.icons.LSP.diagnostics.Warn,
    info_icon = dots.UI.icons.LSP.diagnostics.Info,
    hint_icon = dots.UI.icons.LSP.diagnostics.Hint,
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
      return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
    end,
    hl = { fg = "diag_hint" },
  },
}

local StatusLine = {
  ViMode,
  MacroRec,
  Space,
  FileNameBlock,
  Space,
  Git,
  Align,
  Diagnostics,
  Space,
  WorkDir,
  cursor_position,
  hl = {
    bg = "Normal",
  },
}

local folds = {
  condition = function()
    return vim.v.virtnum == 0
  end,
  init = function(self)
    self.lnum = vim.v.lnum
    self.folded = vim.fn.foldlevel(self.lnum) > vim.fn.foldlevel(self.lnum - 1)
  end,
  {
    condition = function(self)
      return self.folded
    end,
    {
      provider = function(self)
        if vim.fn.foldclosed(self.lnum) == -1 then
          return " "
        end
      end,
      hl = { fg = "gray" },
    },
    {
      provider = function(self)
        if vim.fn.foldclosed(self.lnum) ~= -1 then
          return " "
        end
      end,
      hl = { fg = "yellow" },
    },
  },
  {
    condition = function(self)
      return not self.folded
    end,
    provider = "  ",
  },
  on_click = {
    name = "fold_click",
    callback = function(self, ...)
      if self.handlers.fold then
        self.handlers.fold(self.click_args(self, ...))
      end
    end,
  },
}

local line_numbers = {
  provider = function()
    if vim.v.virtnum ~= 0 then
      return ""
    end

    if vim.v.relnum == 0 then
      return vim.v.lnum .. " "
    end

    return vim.v.relnum
  end,
  on_click = {
    name = "line_number_click",
    callback = function(self, ...)
      if self.handlers.line_number then
        self.handlers.line_number(self.click_args(self, ...))
      end
    end,
  },
  hl = function()
    return {
      fg = vim.v.relnum == 0 and mode_colors[vim.fn.mode()] or "gray",
    }
  end,
}

local Gitsigns = dots.UI.icons.Gitsigns
local git_signs_hl = {
  GitSignsAdd = Gitsigns.add.text,
  GitSignsChange = Gitsigns.change.text,
  GitSignsDelete = Gitsigns.delete.text,
  GitSignsTopdelte = Gitsigns.topdelete.text,
  GitSignsChangedelete = Gitsigns.changedelete.text,
  GitSignsUntracked = Gitsigns.untracked.text,
}

local git_signs = {
  {
    condition = function()
      return not conditions.is_git_repo() or vim.v.virtnum ~= 0
    end,
    provider = "▎",
    hl = { fg = "Normal" },
  },
  {
    condition = function()
      return conditions.is_git_repo() and vim.v.virtnum == 0
    end,
    init = function(self)
      local extmark = vim.api.nvim_buf_get_extmarks(
        0,
        self.git_ns,
        { vim.v.lnum - 1, 0 },
        { vim.v.lnum - 1, -1 },
        { limit = 1, details = true }
      )[1]

      self.sign = extmark and extmark[4]["sign_hl_group"]
    end,
    provider = "▎",
    hl = function(self)
      return { fg = self.sign or "bg" }
    end,
    on_click = {
      name = "gitsigns_click",
      callback = function(self, ...)
        if self.handlers.git_signs then
          self.handlers.git_signs(self.click_args(self, ...))
        end
      end,
    },
  },
}

local signs = {
  init = function(self)
    local signs = vim.fn.sign_getplaced(vim.api.nvim_get_current_buf(), {
      group = "*",
      lnum = vim.v.lnum,
    })

    if #signs == 0 or signs[1].signs == nil then
      self.sign = nil
      self.has_sign = false
      return
    end

    signs = vim.tbl_filter(function(sign)
      return not vim.startswith(sign.group, "gitsigns")
    end, signs[1].signs)

    if #signs == 0 then
      self.sign = nil
    else
      self.sign = signs[1]
    end

    self.has_sign = self.sign ~= nil
  end,
  provider = function(self)
    return self.has_sign and "%s " or "   "
  end,
  hl = function(self)
    if self.has_sign then
      if self.sign.group == "neotest-status" then
        if self.sign.name == "neotest_running" then
          return "NeotestRunning"
        end
        if self.sign.name == "neotest_failed" then
          return "NeotestFailed"
        end
        if self.sign.name == "neotest_passed" then
          return "NeotestPassed"
        end
        return "NeotestSkipped"
      end

      local hl = self.sign.name
      return (vim.fn.hlexists(hl) ~= 0 and hl)
    end
  end,
  on_click = {
    name = "sign_click",
    callback = function(self, ...)
      if self.handlers.signs then
        self.handlers.signs(self.click_args(self, ...))
      end
    end,
  },
}

local Statuscolumns = {
  git_signs,
  signs,
  Align,
  line_numbers,
  Space,
  folds,
  Space,
  hl = "Normal",
  static = {
    click_args = function(self, minwid, clicks, button, mods)
      local args = {
        minwid = minwid,
        clicks = clicks,
        button = button,
        mods = mods,
        mousepos = vim.fn.getmousepos(),
      }
      local sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol)
      if sign == " " then
        sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol - 1)
      end
      args.sign = self.signs[sign]
      vim.api.nvim_set_current_win(args.mousepos.winid)
      vim.api.nvim_win_set_cursor(0, { args.mousepos.line, 0 })

      return args
    end,
    handlers = {},
  },
  init = function(self)
    self.signs = {}

    self.handlers.signs = function()
      return vim.schedule(vim.diagnostic.open_float)
    end

    self.handlers.fold = function(args)
      local lnum = args.mousepos.line
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return
      end
      vim.cmd.execute("'" .. lnum .. "fold" .. (vim.fn.foldclosed(lnum) == -1 and "close" or "open") .. "'")
    end
  end,
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    utils.on_colorscheme(colors)
  end,
  group = vim.api.nvim_create_augroup("Heirline", { clear = true }),
})

return {
  opts = {
    colors = colors,
  },
  statusline = StatusLine,
  statuscolumn = {
    {
      {
        condition = function()
          return not conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
            filetype = { "alpha", "codecompanion", "harpoon", "oil", "lspinfo", "toggleterm" },
          })
        end,
        static = {
          get_signs = function(self, bufnr, lnum)
            local signs = {}

            local extmarks = vim.api.nvim_buf_get_extmarks(
              0,
              bufnr,
              { lnum - 1, 0 },
              { lnum - 1, -1 },
              { details = true, type = "sign" }
            )

            for _, extmark in pairs(extmarks) do
              -- Exclude gitsigns
              if extmark[4].ns_id ~= self.git_ns then
                signs[#signs + 1] = {
                  name = extmark[4].sign_hl_group or "",
                  text = extmark[4].sign_text,
                  sign_hl_group = extmark[4].sign_hl_group,
                  priority = extmark[4].priority,
                }
              end
            end

            table.sort(signs, function(a, b)
              return (a.priority or 0) > (b.priority or 0)
            end)

            return signs
          end,
          git_ns = vim.api.nvim_create_namespace("gitsigns_extmark_signs_"),
          click_args = function(self, minwid, clicks, button, mods)
            local args = {
              minwid = minwid,
              clicks = clicks,
              button = button,
              mods = mods,
              mousepos = vim.fn.getmousepos(),
            }
            local sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol)
            if sign == " " then
              sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol - 1)
            end
            args.sign = self.signs[sign]
            vim.api.nvim_set_current_win(args.mousepos.winid)
            vim.api.nvim_win_set_cursor(0, { args.mousepos.line, 0 })

            return args
          end,
          resolve = function(self, name)
            for pattern, callback in pairs(self.handlers.Signs) do
              if name:match(pattern) then
                return vim.defer_fn(callback, 100)
              end
            end
          end,
          handlers = {
            Signs = {
              ["Neotest.*"] = function()
                require("neotest").run.run()
              end,
              -- ["Debug.*"] = function()
              --   require("dap").continue()
              -- end,
              ["Diagnostic.*"] = function()
                vim.diagnostic.open_float()
              end,
              ["LspLightBulb"] = function()
                vim.lsp.buf.code_action()
              end,
            },
            Dap = function()
              require("dap").toggle_breakpoint()
            end,
            Fold = function(args)
              local line = args.mousepos.line
              if vim.fn.foldlevel(line) <= vim.fn.foldlevel(line - 1) then
                return
              end
              vim.cmd.execute("'" .. line .. "fold" .. (vim.fn.foldclosed(line) == -1 and "close" or "open") .. "'")
            end,
            GitSigns = function()
              vim.defer_fn(function()
                require("gitsigns").blame_line({ full = true })
              end, 100)
            end,
          },
        },
        init = function(self)
          self.signs = {}
        end,
        -- Signs (except for GitSigns)
        {
          init = function(self)
            local signs = self.get_signs(self, -1, vim.v.lnum)
            self.sign = signs[1]
          end,
          provider = function(self)
            return self.sign and self.sign.text or "  "
          end,
          hl = function(self)
            return self.sign and self.sign.sign_hl_group
          end,
          on_click = {
            name = "sc_sign_click",
            update = true,
            callback = function(self, ...)
              local line = self.click_args(self, ...).mousepos.line
              local sign = self.get_signs(self, -1, line)[1]
              if sign then
                self:resolve(sign.name)
              end
            end,
          },
        },
        Align,
        -- Line Numbers
        {
          provider = "%=%4{v:virtnum ? '' : &nu ? (&rnu && v:relnum ? v:relnum : v:lnum) . ' ' : ''}",
          on_click = {
            name = "sc_linenumber_click",
            callback = function(self, ...)
              self.handlers.Dap(self.click_args(self, ...))
            end,
          },
        },
        -- Folds
        {
          init = function(self)
            self.can_fold = vim.fn.foldlevel(vim.v.lnum) > vim.fn.foldlevel(vim.v.lnum - 1)
          end,
          {
            condition = function(self)
              return vim.v.virtnum == 0 and self.can_fold
            end,
            provider = "%C",
          },
          {
            condition = function(self)
              return not self.can_fold
            end,
            Space,
          },
          on_click = {
            name = "sc_fold_click",
            callback = function(self, ...)
              self.handlers.Fold(self.click_args(self, ...))
            end,
          },
        },
        -- Git Signs
        {
          {
            condition = function()
              return conditions.is_git_repo()
            end,
            init = function(self)
              local extmark = vim.api.nvim_buf_get_extmarks(
                0,
                self.git_ns,
                { vim.v.lnum - 1, 0 },
                { vim.v.lnum - 1, -1 },
                { limit = 1, details = true }
              )[1]

              self.sign = extmark and extmark[4]["sign_hl_group"]
            end,
            {
              provider = "▏",
              hl = function(self)
                return self.sign or { fg = "bg" }
              end,
              on_click = {
                name = "sc_gitsigns_click",
                callback = function(self, ...)
                  self.handlers.GitSigns(self.click_args(self, ...))
                end,
              },
            },
          },
          {
            condition = function()
              return not conditions.is_git_repo()
            end,
            Space,
          },
        },
      },
    },
  },
}
