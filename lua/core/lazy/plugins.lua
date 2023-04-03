local modules = {}
local modules_dir = vim.fn.stdpath("config") .. "/lua/modules"

local append_nativertp = function()
  package.path = package.path
  .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")
end

local get_plugins_list = function()
  local list = {}
  local plugins_list = vim.split(vim.fn.glob(modules_dir .. "/plugins/*.lua"), "\n")
  if type(plugins_list) == "table" then
    for _, f in ipairs(plugins_list) do
      -- fill list with `plugins/*.lua`'s path used for later `require` like this:
      -- list[#list + 1] = "plugins/completion.lua"
      list[#list + 1] = f:sub(#modules_dir - 6, -1)
    end
  end
  return list
end

append_nativertp()

local plugins_file = get_plugins_list()
for _, m in ipairs(plugins_file) do
  -- require modules which returned in previous operation like this:
  -- local modules = require("modules/plugins/completion.lua")
  local modules = require(m:sub(0, #m - 4))
  if type(modules) == "table" then
    for name, conf in pairs(modules) do
      modules[#modules + 1] = vim.tbl_extend("force", { name }, conf)
    end
  end
end

return modules
