local lazy_require = require("snips.lazy-require").require_on_index

local heirline = lazy_require("heirline")
local bufferline = require("plugins.configs.ui.heirline.bufferline")
local statusline = require("plugins.configs.ui.heirline.statusline")
local statuscolumn = require("plugins.configs.ui.heirline.statuscolumn")
local colors = require("plugins.configs.ui.heirline.colors")

-- Unpack the results and call the setup function with the appropriate arguments
heirline.setup({
  statusline = statusline,
  tabline = bufferline,
  statuscolumn = statuscolumn.line_number,
})

