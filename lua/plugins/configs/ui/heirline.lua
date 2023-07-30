local U = require("core.utils.colors")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local Normal = string.format("#%06x", utils.get_highlight("Normal").fg)
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

local colors = {
  bright_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.7),
  brighter_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.5),
  brightest_bg = U.blend(string.format("#%06x", utils.get_highlight("Comment").fg, 0.3), Normal, 1.3),
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
        return { fg = mode_colors[mode], bold = true }
      end,
    },
    {
      provider = " ",
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { bg = mode_colors[mode], fg = "Normal", bold = true }
      end,
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
          fg = mode_colors[mode],
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
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
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
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
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
  Space,
  WorkDir,
  Space,
  Scrollbar,
}

local StatusLines = {
  hl = "Normal",

  StatusLine,
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
          return ""
        end
      end,
      hl = { fg = "brightest_bg" },
    },
    {
      provider = function(self)
        if vim.fn.foldclosed(self.lnum) ~= -1 then
          return ""
        end
      end,
      hl = { fg = "yellow" },
    },
  },
  {
    condition = function(self)
      return not self.folded
    end,
    provider = " ",
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
      fg = vim.v.relnum == 0 and mode_colors[vim.fn.mode()] or "brightest_bg",
    }
  end,
}

local git_signs = {
  {
    condition = function()
      return not conditions.is_git_repo() or vim.v.virtnum ~= 0
    end,
    provider = "┃",
    hl = { fg = "Normal" },
  },
  {
    condition = function()
      return conditions.is_git_repo() and vim.v.virtnum == 0
    end,
    init = function(self)
      local signs = vim.fn.sign_getplaced(vim.api.nvim_get_current_buf(), {
        group = "gitsigns_vimfn_signs_",
        id = vim.v.lnum,
        lnum = vim.v.lnum,
      })

      if #signs == 0 or signs[1].signs == nil or #signs[1].signs == 0 or signs[1].signs[1].name == nil then
        self.sign = nil
      else
        self.sign = signs[1].signs[1]
      end

      self.has_sign = self.sign ~= nil
    end,
    provider = "┃",
    hl = function(self)
      if self.has_sign then
        return self.sign.name
      end
      return { fg = "Normal" }
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
  -- condition = function() return conditions.has_diagnostics() end,
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

    -- Filter out git signs
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
    if self.has_sign then
      return vim.fn.sign_getdefined(self.sign.name)[1].text
    end
    return "  "
  end,
  hl = function(self)
    if self.has_sign then
      -- Neotest signs
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

      -- Everything else
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
  signs,
  Align,
  line_numbers,
  Space,
  git_signs,
  folds,
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

    self.handlers.signs = function(args)
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

vim.schedule(function()
  vim.api.nvim_create_augroup("Heirline", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      utils.on_colorscheme(colors)
    end,
    group = "Heirline",
  })
end)

return {
  opts = {
    colors = colors,
  },
  statusline = StatusLines,
  statuscolumn = Statuscolumns,
}
