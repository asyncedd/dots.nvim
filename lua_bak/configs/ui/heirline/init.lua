local status, heirline = pcall(require, "heirline")
local status1, conditions = pcall(require, "heirline.conditions")
local status2, colors = pcall(require, "configs.ui.heirline.colors")
local status3, ViMode = pcall(require, "configs.ui.heirline.vimode")
local status4, FileName = pcall(require, "configs.ui.heirline.filename")
local status5, Gitsigns = pcall(require, "configs.ui.heirline.git")
local status6, Scrollbar = pcall(require, "configs.ui.heirline.scrollbar")
local status7, File = pcall(require, "configs.ui.heirline.file")
-- local Gitsigns = require("configs.ui.heirline.git")
if (not status) then return end
if (not status1) then return end
if (not status2) then return end
if (not status3) then return end
if (not status4) then return end
if (not status5) then return end
if (not status6) then return end
if (not status7) then return end

heirline.load_colors(colors)

local Align = { provider = "%=" }
local Space = { provider = " " }

local DefaultStatusLine = {
  ViMode, Space, FileName.WorkDir, Space, FileName.FileNameBlock , Space, Gitsigns,
  Align,
  Align, File.FileType, Space, Scrollbar.Ruler, Space, Scrollbar.ScrollBar,
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
  },

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  DefaultStatusLine
}

heirline.setup({
  statusline = StatusLines
})
