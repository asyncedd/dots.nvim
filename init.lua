-- Neoinit v2.0

-- Set options.
require("settings.options")

-- Create some autocommands.
require("settings.autocmd")

local config = vim.fn.stdpath("config")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = config .. "/lua/plugins/configs/?.lua;" .. config .. "/lua/plugins/configs/?/init.lua;" .. package.path

-- Setup lazy.nvim
require("plugins")

-- Enable the catppuccin colorshceme
vim.api.nvim_command("colorscheme catppuccin")

-- Defer time-consuming tasks later.
vim.defer_fn(function()
  require("core.after")
end, 0)
