local M

local tablineoffset = require("ui.heirline.bufferline.tablineoffset")
local Bufferline = require("ui.heirline.bufferline.bufferline")
local Tabpages = require("ui.heirline.bufferline.tablist").Tabpages

M = {
  tablineoffset,
  Bufferline,
  Tabpages,
}

return M
