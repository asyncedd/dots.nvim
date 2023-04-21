local M = {}

M.setup = function()
  require("core.options")
  require("mappings.movement") -- As of now, it's requiring mappings that in turn requires modules inside it. It is of course not as efficent.
end

return M
