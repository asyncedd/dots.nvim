local M = {}

M.cursorWord = function()
  require("mini.cursorword").setup()
end

M.splitJoin = function()
  require("mini.splitjoin").setup()
end

M.surround = function()
  require("mini.surround").setup()
end

return M
