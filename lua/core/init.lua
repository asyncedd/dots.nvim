-- Neoinit v.0.1
local o = vim.opt

-- Load the configuration file.
local config = require("user.settings")

-- Disable builtin Plugins.
require("core.disableBuiltinPlugins")

-- Set the options.
require("user.options")

-- Set the package.path.
-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?/init.lua;" .. package.path

-- Bootstrap Lazy.nvim
require("core.bootstrap")

-- Initalize lazy.nvim
require("plugins")

-- Set the colorscheme.
local colorscheme = require("user.settings.colorscheme")
vim.api.nvim_command("colorscheme " .. colorscheme)

-- Set some icons
require("core.setIcons")

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()
    o.shadafile = ""
  end
})

vim.schedule(function ()
  -- Load options that don't require any UI
  o.clipboard = "unnamed,unnamedplus" -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)
  -- 1.2 Persistent undos, across sessions.
  o.undofile = true
end)
