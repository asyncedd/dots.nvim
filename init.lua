-- Neoinit v.0.1
local settings = require("user.settings")

if settings.plugins.enable == false and settings.builtins.disable == true then
  print("WARNING: If lazy.nvim isn't loaded via plugins.enable, you're not able to disable builtins either.")
end

if settings.cache.enable == true then
  vim.loader.enable()
end

require("user.autocmd")

if settings.builtins.fake_load then
  local disableBuiltinPlugins = require("user.builtinPlugins")

  for _, plugin in ipairs(disableBuiltinPlugins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

require("user.options")

local config = vim.fn.stdpath("config")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = config .. "/lua/plugins/configs/?.lua;" .. config .. "/lua/plugins/configs/?/init.lua;" .. package.path

if settings.plugins.enable == true then
  require("plugins")

  vim.api.nvim_command("colorscheme " .. settings.colorscheme)
end

vim.schedule(function()
  require("core.after")
end)
