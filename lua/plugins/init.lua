local plugins = {}
local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

plugins[1] = {
  require("user.colorschemes")
}

plugins[2] = {
  "nvim-treesitter/nvim-treesitter",
  init = lazyLoad("nvim-treesitter"),
  config = function()
    require("editor.treesitter")
  end,
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
}

plugins[3] = {
  "neovim/nvim-lspconfig",
  init = lazyLoad("nvim-lspconfig"),
  config = function()
    require("lsp.config")
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        require("lsp.mason")
      end,
    },
    "folke/neodev.nvim",
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
    {
      "L3MON4D3/LuaSnip",
      keys = function()
        return {}
      end,
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    require("completion.cmp")
  end,
}

plugins[6] = {
  "windwp/nvim-autopairs",
  config = true,
  event = "InsertEnter",
}

plugins[7] = {
  "numToStr/Comment.nvim",
  config = true,
  event = "VeryLazy",
}

plugins[8] = {
  "lukas-reineke/indent-blankline.nvim",
  config = true, 
  init = lazyLoad("indent-blankline.nvim")
}

plugins[9] = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("editor.gitsigns")
  end,
  init = lazyLoad("gitsigns.nvim"),
}

plugins[10] = {
  "rebelot/heirline.nvim",
  init = lazyLoad("heirline.nvim"),
  config = function()
    require("ui.heirline")
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

plugins[11] = {
  "ggandor/leap.nvim",
  init = lazyLoad("leap.nvim"),
  config = function()
    require("editor.leap")
  end,
}

plugins[12] = {
  "LeonHeidelbach/trailblazer.nvim",
  config = true, 
  init = lazyLoad("trailblazer.nvim"),
}

plugins[13] = {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("tools.telescope")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy"
}

plugins[14] = {
  "thePrimeagen/harpoon",
  config = function()
    require("tools.harpoon")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
}

plugins[15] = {
  "NvChad/nvim-colorizer.lua",
  config = true,
  event = "VeryLazy",
}

plugins[16] = {
  "glepnir/lspsaga.nvim",
  config = true,
  init = lazyLoad("lspsaga.nvim"),
}

plugins[17] = {
  "echasnovski/mini.nvim",
  config = function()
    require("plugins.configs.mini")
  end,
  init = lazyLoad("mini.nvim"),
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
