-- Enable highlighitng of cursorwords.
require("mini.cursorword").setup()
-- Enable splitjoins.
require("mini.splitjoin").setup()
-- Enable surround.
require("mini.surround").setup({
  mappings = {
    add = '<leader>sa', -- Add surrounding in Normal and Visual modes
    delete = '<leader>sd', -- Delete surrounding
    find = '<leader>sf', -- Find surrounding (to the right)
    find_left = '<leader>sF', -- Find surrounding (to the left)
    highlight = '<leader>sh', -- Highlight surrounding
    replace = '<leader>sr', -- Replace surrounding
    update_n_lines = '<leader>sn', -- Update `n_lines`

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring({})
    end,
  },
})
-- Enable AI.
require("mini.ai").setup()
-- Indentscope.
require("mini.indentscope").setup({
  symbol = "│",
  options = { try_as_border = true },
})

-- Comments
require("mini.comment").setup()
