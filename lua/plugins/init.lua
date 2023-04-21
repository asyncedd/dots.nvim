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

plugins[7] = {
  "numToStr/Comment.nvim",
  config = true,
  init = lazyLoad("Comment.nvim")
}

plugins[8] = {
  "lukas-reineke/indent-blankline.nvim",
  config = require("ui.blankline"),
  init = lazyLoad("indent-blankline.nvim")
}

plugins[9] = {
  "echasnovski/mini.indentscope",
  config = require("ui.indentscope"),
  init = lazyLoad("mini.indentscope")
}

plugins[10] = {
  "rebelot/heirline.nvim",
  init = lazyLoad("heirline.nvim"),
  config = require("ui.heirline"),
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

plugins[11] = {
  "ggandor/leap.nvim",
  init = lazyLoad("leap.nvim"),
  dependencies = {
    "ggandor/flit.nvim",
  },
  config = require("editor.leap"),
}

plugins[12] = {
  "LeonHeidelbach/trailblazer.nvim",
  config = require("editor.trailblazer"),
  init = lazyLoad("trailblazer.nvim"),
}

plugins[13] = {
  "echasnovski/mini.ai",
  config = require("editor.miniai"),
  init = lazyLoad("mini.ai"),
}

plugins[14] = {
  "nvim-telescope/telescope.nvim",
  config = require("tools.telescope"),
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy"
}

plugins[15] = {
  "thePrimeagen/harpoon",
  config = require("tools.harpoon"),
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
}

plugins[16] = {
  'gorbit99/codewindow.nvim',
  config = require("ui.minimap"),
  event = "VeryLazy",
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
  },
})

