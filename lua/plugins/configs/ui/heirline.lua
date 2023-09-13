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

local colors = {
  comment = utils.get_highlight("CursorLineNrNC").fg,
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
      hl = { fg = "comment" },
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
      fg = vim.v.relnum == 0 and mode_colors[vim.fn.mode()] or "comment",
    }
  end,
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
    provider = "▎",
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
  git_signs,
  signs,
  Align,
  line_numbers,
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
  statuscolumn = Statuscolumns,
}
