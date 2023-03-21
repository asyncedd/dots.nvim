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
require("core.lazy")

-- Set the colorscheme.
local colorscheme = require("user.settings.colorscheme")
vim.api.nvim_command("colorscheme " .. colorscheme)

