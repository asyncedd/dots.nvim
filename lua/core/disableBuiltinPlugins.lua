local disableBuiltinPlugins = require("user.builtinPlugins")
local o = vim.opt

for _, plugin in ipairs(disableBuiltinPlugins) do
  vim.g["loaded_" .. plugin] = 1
end

o.spell = false
o.undofile = false
