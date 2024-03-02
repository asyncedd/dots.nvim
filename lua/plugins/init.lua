local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("asyncedd.utils").event("LazyFile")
require("lazy").setup({
  { import = "plugins.specs" },
  dots.languages.enable,
  dots.UI.colorscheme.themes,
  dots.goodies.enable,
}, {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { dots.UI.colorscheme.value, "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "tutor",
      },
    },
  },
  change_detection = {
    notify = false,
  },
})
