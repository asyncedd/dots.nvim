local plugins = {}
local disabledPlugins = require("user.builtinPlugins")

plugins[1] = {
  "catppuccin/nvim",
  -- config = require("plugins.configs.ui.catppuccin"),
}

plugins[2] = {
  "nvim-treesitter/nvim-treesitter",
  lazy = require("core.utils.lazyLoad")("nvim-treesitter"),
  config = require("plugins.configs.editor.treesitter"),
  build = ":TSUpdate",
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

