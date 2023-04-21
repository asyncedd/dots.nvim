local M = {}

local motion = function(table)
  table.insert(M, table)
end

motion({
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",
  "ggandor/leap-spooky.nvim",
  "tpope/vim-repeat",
  "echasnovski/mini.ai"
})

return M
