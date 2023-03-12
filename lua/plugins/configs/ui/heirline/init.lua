local lazy_require = require("snips.lazy-require").require_on_index
local heirline = lazy_require("heirline")
local Bufferline = require("plugins.configs.ui.heirline.bufferline")
local StatusLines = require("plugins.configs.ui.heirline.statusline")
-- local StatusColumn = require("plugins.configs.ui.heirline.statuscolumn")

require("plugins.configs.ui.heirline.colors")

-- local statuscolumn = {
--
--   -- StatusColumn.diagnostic_signs,
--   StatusColumn.line_number,
--   StatusColumn.gitsigns_or_bar,
-- }

heirline.setup({
  statusline = StatusLines,
  tabline = Bufferline,
  -- statuscolumn = statuscolumn,
})
