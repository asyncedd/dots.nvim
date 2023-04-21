local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("WARNING: Bootstrapping lazy, it might take some time so, be patient!")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("OK: Bootstrapped lazy!")
  print("Installing plugins now. NOW this will take some time.")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.specs" },
}, {
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    missing = true,
    colorscheme = { "catppuccin", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "man",
        "rplugin",
        "spellfile",
      },
    },
  },
  ui = {
    throttle = 150,
  },
})
