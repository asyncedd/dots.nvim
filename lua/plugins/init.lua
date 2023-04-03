local plugins = {}
local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

plugins[1] = {
  "catppuccin/nvim",
  name = "catppuccin",
  init = lazyLoad("catppuccin"),
  config = require("plugins.configs.ui.catppuccin"),
}

plugins[2] = {
  "nvim-treesitter/nvim-treesitter",
  init = lazyLoad("nvim-treesitter"),
  config = require("plugins.configs.editor.treesitter"),
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
}

plugins[3] = {
  "neovim/nvim-lspconfig",
  init = lazyLoad("nvim-lspconfig") 
}

plugins[4] = {
  "williamboman/mason.nvim",
  init = lazyLoad("mason.nvim"),
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = require("plugins.configs.lsp.mason"),
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

