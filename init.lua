-- init.lua
vim.loader.enable()

require("settings")

-- Setup some options
require("settings.options")

-- Setup the plugins
require("plugins")

vim.cmd("colorscheme " .. dots.colorscheme.enabled or "habamax")
