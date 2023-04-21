local ufo = require("ufo")
local vim = vim
local o = vim.api.nvim_set_option_value

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    ufo.closeAllFolds()
    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)

  end
})
