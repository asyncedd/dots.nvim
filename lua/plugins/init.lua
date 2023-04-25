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
  "asyncedd/apr",
  -- { import = "apr.coding.autopairs" },
  { import = "apr.coding.tabout" },
  { import = "apr.coding.treesj" },
  -- { import = "apr.coding.dial" },
  { import = "plugins.specs" },
}, {
  defaults = {
    lazy = true,
    version = false,
    cond = not vim.g.started_by_firenvim,
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
