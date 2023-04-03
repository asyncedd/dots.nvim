local plugins = {}
local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

plugins[1] = {
  {
    "catppuccin/nvim",
    config = function()
      require("ui.catppuccin")
    end,
  },
  "FrenzyExists/aquarium-vim",
  {
    "wuelnerdotexe/vim-enfocado",
    config = function ()
      vim.g.enfocado_style = "nature" -- You can go for "neon" too.
    end,
  },
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
      config = function()
        require("lsp.mason")
      end,
      -- event = "BufReadPre",
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
  "lukas-reineke/indent-blankline.nvim",
  config = true,
  init = lazyLoad("indent-blankline.nvim"),
}

plugins[8] = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("editor.gitsigns")
  end,
  init = lazyLoad("gitsigns.nvim"),
}

plugins[9] = {
  "rebelot/heirline.nvim",
  event = "BufReadPost",
  config = function()
    require("ui.heirline")
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

plugins[10] = {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function()
    require("editor.leap")
  end,
}

plugins[11] = {
  "LeonHeidelbach/trailblazer.nvim",
  config = true,
  event = "VeryLazy",
}

plugins[12] = {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("tools.telescope")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy"
}

plugins[13] = {
  "thePrimeagen/harpoon",
  config = function()
    require("tools.harpoon")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
}

plugins[14] = {
  "NvChad/nvim-colorizer.lua",
  config = true,
  event = "VeryLazy",
}

plugins[15] = {
  "glepnir/lspsaga.nvim",
  config = true,
  init = lazyLoad("lspsaga.nvim"),
}

plugins[16] = {
  "echasnovski/mini.nvim",
  config = function()
    require("plugins.configs.mini")
  end,
  init = lazyLoad("mini.nvim"),
}

plugins[17] = {
  "lukas-reineke/headlines.nvim",
  config = true,
  ft = {
    "md",
  },
}

plugins[18] = {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("tools.nvimtree")
  end,
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
  },
}

plugins[19] = {
  "glepnir/dashboard-nvim",
  config = true,
  init = function()
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function ()
        if("" == filename) then
          require("lazy").load({ plugins = "dashboard-nvim" })
        else
          return
        end
      end
    })
  end,
}

plugins[20] = {
  "folke/trouble.nvim",
  config = true,
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
    { "gR", "<cmd>TroubleToggle lsp_references<cr>" },
  },
}

plugins[21] = {
  "simrat39/symbols-outline.nvim",
  config = true,
  keys = {
    { "<leader>so", "<cmd>SymbolsOutline<cr>" }
  },
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

