-- Enable highlighitng of cursorwords.
require("mini.cursorword").setup()
-- Enable splitjoins.
require("mini.splitjoin").setup()
-- Enable surround.
require("mini.surround").setup()
-- Enable AI.
require("mini.ai").setup()
-- Indentscope.
require("mini.indentscope").setup({
  symbol = "│",
  options = { try_as_border = true },
})
