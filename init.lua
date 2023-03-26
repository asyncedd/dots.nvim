-- Neoinit v.0.1

require("user.autocmd")

require("core.disableBuiltinPlugins")

require("user.options")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?/init.lua;" .. package.path

require("plugins")

local colorscheme = require("user.settings").colorscheme
vim.api.nvim_command("colorscheme " .. colorscheme)

vim.schedule(function ()
  require("core.after")
end)

