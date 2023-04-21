local M

local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local ViMode = require("ui.heirline.statusline.vimode")
-- Unfortunately lazy_requiring ViMode doesn't work ;-;
local FileName = require("ui.heirline.statusline.filename")
local Gitsigns = require("ui.heirline.statusline.git")
local Scrollbar = require("ui.heirline.statusline.scrollbar")
local File = require("ui.heirline.statusline.file")
local LSP = require("ui.heirline.statusline.lsp")
local Lazy = require("ui.heirline.statusline.lazy")

local Align = { provider = "%=", hl = { bg = "normal" } }
local Space = { provider = " ", hl = { bg = "normal" } }

local DefaultStatusLine = {
  Lazy,
  Space,
  ViMode,
  Space,
  {
    FileName.WorkDir,
    hl = { bg = "normal" },
  },
  {
    FileName.FileNameBlock,
    hl = { bg = "normal" },
  },
  Align,
  Align,
  {
    Gitsigns,
    hl = { bg = "normal" },
  },
  Space,
  {
    LSP.LSPActive,
    hl = { bg = "normal" },
  },
  Space,
  {
    LSP.Diagnostics,
    hl = { bg = "normal" },
  },
  Align,
  Align,
  Align,
  Space,
  {
    File.FileType,
    hl = { bg = "normal" },
  },
  Space,
  Scrollbar.Ruler,
  Space,
  Scrollbar.ScrollBar,
}

local StatusLines = {

  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  static = {
    mode_colors_map = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "orange",
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
    scrollbarHL = function()
      local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
      local color

      if position <= 5 then
        color = "aqua"
        -- style = "bold"
      elseif position >= 95 then
        color = "red"
        -- style = "bold"
      else
        color = "purple"
        -- style = nil
      end

      return color
    end,
  },

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  DefaultStatusLine,
}

M = StatusLines

return M
