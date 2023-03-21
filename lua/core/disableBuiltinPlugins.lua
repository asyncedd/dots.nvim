local disableBuiltinPlugins = require("user.builtinPlugins")

for _, plugin in pairs(disableBuiltinPlugins) do
  vim.g["loaded_" .. plugin] = 1
end
