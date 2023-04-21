-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("NOTICE: Bootstrapping Lazy.nvim. Please wait! (It shouldn't be too long!)")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
  print("OK: Done!")
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local disabledPlugins = require("user.builtinPlugins")

require("lazy").setup({
  { import = "plugins.specs" }
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
  },
  install = {
    colorscheme = {
      "catppuccin",
      "habamax",
    }
  },
  defaults = {
    lazy = true,
    version = false,
  },
  ui = {
    throttle = 100,
  },
})

