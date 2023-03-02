local M = {}

local folding = function(table)
  table.insert(M, table)
end

folding({
  "kevinhwang91/nvim-ufo",
  "kevinhwang91/promise-async"
})

return M
