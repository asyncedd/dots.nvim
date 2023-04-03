-- Bootstrap lazy.nvim

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

require("lazy").setup({
  { import = "plugins" }
}, {
    performance = {
      rtp = {
        disabled_plugins = {
          "2html_plugin",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "logipat",
          "netrw",
          "netrwFileHandlers",
          "loaded_remote_plugins",
          "loaded_tutor_mode_plugin",
          "netrwPlugin",
          "netrwSettings",
          "rrhelper",
          "spellfile_plugin",
          "tar",
          "tarPlugin",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",
          "rplugin",
          "tohtml",
          "tutor",
          "shada",
          "spellfile",
          "matchit",
          "matchparen"
        },
      },
    },
    install = {
      colorscheme = { "catppuccin", "tokyonight", "habamx" },
    },
    defaults = {
      lazy = true
    }
  })
