-- Neoinit v.0.1

-- Load the configuration file.
local config = require("user.settings")

-- Disable builtin Plugins.
require("core.disableBuiltinPlugins")

-- Set the options.
require("user.options")

-- Bootstrap Lazy.nvim
require("core.bootstrap")

-- Initalize lazy.nvim
require("plugins")

-- Set the colorscheme.
local colorscheme = require("user.settings.colorscheme")
vim.api.nvim_command("colorscheme " .. colorscheme)

vim.schedule(function ()
  -- Load options that don't require any UI
  vim.opt.clipboard = "unnamed,unnamedplus" -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)
end)
