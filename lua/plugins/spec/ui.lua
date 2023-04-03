local M = {}

local ui = function(table)
  teble.insert(M, table)
end

ui({
  "lukas-reineke/indent-blankline.nvim",
  "monkoose/matchparen.nvim",
  "norcalli/nvim-colorizer.lua",
  "rebelot/heirline.nvim"
})

return M
