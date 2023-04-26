local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print(" Bootstrapping lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print(" Sucessfully bootstrapped lazy.nvim!")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({}, {
  defaults = {
    lazy = true,
    version = nil,
  },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin",
        "spellfile",
      },
    },
  },
})
