-- Neoinit v.0.1

-- Load the configuration file.
local config = require("user.settings")

-- Disable builtin Plugins.
require("core.disableBuiltinPlugins")

-- Bootstrap Lazy.nvim
require("core.bootstrap")

-- Set the options.
require("user.options")

-- Initalize lazy.nvim
require("core.lazy")
