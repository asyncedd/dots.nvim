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

require("lazy").setup(
  {
    -- UI related plugins
    "lukas-reineke/indent-blankline.nvim",
    "echasnovski/mini.indentscope",
    "monkoose/matchparen.nvim",
    "norcalli/nvim-colorizer.lua",
    "echasnovski/mini.animate",
    "tamton-aquib/flirt.nvim",
    "catppuccin/nvim",
    "rebelot/kanagawa.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    "rebelot/heirline.nvim",
    -- Editor related plugins
    "numToStr/Comment.nvim",
    "kevinhwang91/nvim-ufo",
    "kevinhwang91/promise-async",
    -- Motion related plugins
    "ggandor/leap.nvim",
    "ggandor/flit.nvim", 
    "ggandor/leap-spooky.nvim",
    "tpope/vim-repeat",
    "echasnovski/mini.ai",
    -- Treesitter related plugins
    "nvim-treesitter/nvim-treesitter",
    "David-Kunz/markid",
    -- Core plugins
    "nvim-tree/nvim-web-devicons"
  }, 
  {
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
  }
)
