vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

require("settings")
require("settings.options")
require("plugins")

require("settings.autocmd")
require("settings.keymap")

-- https://www.reddit.com/r/neovim/comments/1ayx62p/config_for_diagnostics/
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
  },
})

vim.filetype.add({
  extension = {
    postcss = "css",
  },
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
