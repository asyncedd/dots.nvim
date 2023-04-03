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

local lazyopts = {
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    colorscheme = { "catppuccin", "tokyonight", "habamax" },
  },
  performance = {
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        -- "matchup",
        -- "matchparen",
        "tarPlugin",
        "tohtml",
        -- "tutor",
        "zipPlugin",
        "shada",
        "spellfile"
      },
    },
  },
}

require("lazy").setup({
  { import = "modules.plugins" }
}, lazyopts)
