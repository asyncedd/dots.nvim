vim.schedule(function ()
  local bufferline = require("ui.heirline.bufferline")
  local statusline = require("ui.heirline.statusline")
  -- local statuscolumn = require("plugins.configs.ui.heirline.statuscolumn")
  require("ui.heirline.colors")

  -- Unpack the results and call the setup function with the appropriate arguments
  require("heirline").setup({
    statusline = statusline,
    tabline = bufferline,
    -- statuscolumn = statuscolumn,
  })
end)
