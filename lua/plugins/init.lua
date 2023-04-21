local plugins = {}
local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

plugins[1] = {
  "catppuccin/nvim",
  name = "catppuccin",
  init = lazyLoad("catppuccin"),
  config = require("ui.catppuccin"),
}

plugins[2] = {
  "nvim-treesitter/nvim-treesitter",
  init = lazyLoad("nvim-treesitter"),
  config = require("editor.treesitter"),
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
}

plugins[3] = {
  "neovim/nvim-lspconfig",
  -- init = lazyLoad("nvim-lspconfig"),
  event = "BufReadPost",
  config = require("lsp.config"),
  dependencies = {
    {
      "williamboman/mason.nvim",
      init = lazyLoad("mason.nvim"),
      dependencies = {
	"williamboman/mason-lspconfig.nvim",
      },
      config = require("lsp.mason"),
    }
  }
}

plugins[5] = {
  "j-hui/fidget.nvim",
  config = true,
  event = "VeryLazy"
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

