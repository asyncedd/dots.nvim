local statusline = require("ui.heirline.statusline")
local bufferline = require("ui.heirline.tabline")

require("heirline").setup({
  statusline = { statusline },
  tabline = { bufferline },
})

