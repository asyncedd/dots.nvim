local M = {}

local ui = function(spec)
  table.insert(M, spec)
end

ui({
  "catppuccin/nvim", -- ☕ Mocha!
  "wuelnerdotexe/vim-enfocado", -- 🧠 Great philosphy
  "folke/tokyonight", -- 🌆 If you're around RGB
  "EdenEast/nightfox.nvim", -- 🦊 OwO
  "rebelot/kanagawa.nvim" -- 🌊 Famous!
})

return M
