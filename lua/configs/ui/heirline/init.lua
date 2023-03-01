local status, heirline = pcall(require, "heirline")
local status1, conditions = pcall(require, "heirline.conditions")
local status2, colors = pcall(require, "configs.ui.heirline.colors")
local status3, ViMode = pcall(require, "configs.ui.heirline.vimode")
local status4, FileName = pcall(require, "configs.ui.heirline.filename")
local status5, Gitsigns = pcall(require, "configs.ui.heirline.git")
-- local Gitsigns = require("configs.ui.heirline.git")
if (not status) then return end
if (not status1) then return end
if (not status2) then return end
if (not status3) then return end
if (not status4) then return end
if (not status5) then return end

heirline.load_colors(colors)

local Align = { provider = "%=" }
local Space = { provider = " " }

local DefaultStatusLine = {
  ViMode, Space, FileName.FileNameBlock , Space, Gitsigns
}

local StatusLines = {

  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  DefaultStatusLine
}

heirline.setup({
  statusline = StatusLines
})
