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
  init = lazyLoad("nvim-lspconfig"),
  event = "BufReadPost",
  config = require("lsp.config"),
  dependencies = {
    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
      config = require("lsp.mason"),
      event = "BufReadPost",
    }
  }
}

plugins[4] = {
  "j-hui/fidget.nvim",
  config = true,
  init = lazyLoad("fidget.nvim"),
}

plugins[5] = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
  },
  config = require("completion.cmp"),
}

plugins[6] = {
  "windwp/nvim-autopairs",
  config = true,
  event = "InsertEnter",
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

