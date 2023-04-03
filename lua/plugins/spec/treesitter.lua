local M = {}

local treesitter = function(table)
  table.insert(M, treesitter)
end

treesitter({
  "nvim-treesitter/nvim-treesitter",
  "David-Kunz/markid"
})

return M
