local plugins = {}
local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

plugins[1] = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = lazyLoad("catppuccin"),
  config = require("plugins.configs.ui.catppuccin"),
}

plugins[2] = {
  "nvim-treesitter/nvim-treesitter",
  lazy = lazyLoad("nvim-treesitter"),
  config = require("plugins.configs.editor.treesitter"),
  build = ":TSUpdate",
}

plugins[3] = {
  "neovim/nvim-lspconfig",
  lazy = lazyLoad("nvim-lspconfig") 
}

require("lazy").setup({
  plugins,
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
  },
  install = {
    colorscheme = { "catppuccin" }
  },
  defaults = {
    lazy = true,
    version = false,
  },
})

