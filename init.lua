-- Neoinit v.0.1

vim.loader.enable()

require("user.autocmd")

-- local disableBuiltinPlugins = require("user.builtinPlugins")
--
-- for _, plugin in ipairs(disableBuiltinPlugins) do
--   vim.g["loaded_" .. plugin] = 1
-- end

require("user.options")

local config = vim.fn.stdpath("config")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = config .. "/lua/plugins/configs/?.lua;" .. config .. "/lua/plugins/configs/?/init.lua;" .. package.path

require("plugins")

-- vim.api.nvim_command("colorscheme tokyonight")
vim.api.nvim_command("colorscheme catppuccin")
-- vim.api.nvim_command("colorscheme onedark")
-- vim.api.nvim_command("colorscheme kanagawa")

vim.schedule(function()
  require("core.after")
end)


