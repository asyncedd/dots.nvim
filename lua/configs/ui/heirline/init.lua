local heirline = require("heirline")

local conditions = require("heirline.conditions")

local colors = require("configs.ui.heirline.colors")

local ViMode = require("configs.ui.heirline.vimode")

local FileName = require("configs.ui.heirline.filename")

heirline.load_colors(colors)

local Align = { provider = "%=" }
local Space = { provider = " " }

local DefaultStatusLine = {
  ViMode, Space, FileName.FileNameBlock
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
