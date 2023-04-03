local lazy_require = require("snips.lazy-require").require_on_index

local M

local tablineoffset = lazy_require("plugins.configs.ui.heirline.bufferline.tablineoffset")
local Bufferline = lazy_require("plugins.configs.ui.heirline.bufferline.bufferline")
local Tabpages = lazy_require("plugins.configs.ui.heirline.bufferline.tablist").Tabpages

M = {
  tablineoffset,
  Bufferline,
  Tabpages
}

return M
