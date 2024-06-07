vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("settings")

vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
require("lazy").setup({
  { import = "plugins.specs" },
  dots.languages.enable,
}, require("configs.lazy"))

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("settings.options")
require("settings.autocmd")

vim.schedule(function()
  require("settings.keymap")
end)
