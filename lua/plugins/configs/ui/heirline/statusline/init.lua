local ViMode = require("ui.heirline.statusline.vimode").ViMode
local FileNames = require("ui.heirline.statusline.filename")
local Lsp = require("ui.heirline.statusline.lsp")
local cmdheight = require("ui.heirline.statusline.cmdheight")
local ruler = require("ui.heirline.statusline.ruler")
local Git = require("ui.heirline.statusline.git")
local file = require("ui.heirline.statusline.file")

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Space = { provider = " " }
local Align = { provider = "%=" }

local DefaultStatusLines = {
  ViMode, Space, FileNames.FileNameBlock, Space, cmdheight.MacroRec, Align, Align,
  Lsp.LSPActive, Space, Lsp.Diagnostics, Space, Git.Git, Align, Align, Align,
  file, ruler.Ruler, ruler.ScrollBar,
}

local StatusLines = {
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
  },

  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,


  DefaultStatusLines,
}

return StatusLines

