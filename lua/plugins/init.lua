local disabledPlugins = require("user.builtinPlugins")
local lazyLoad = require("core.utils.lazyLoad")

local plugins = {
  {
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
    {
      "folke/tokyonight.nvim",
      config = function()
        require("ui.tokyonight")
      end,
    },
    {
      "rebelot/kanagawa.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = lazyLoad("nvim-treesitter"),
    config = function()
      require("editor.treesitter")
    end,
    dependencies = {
    },
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
  },
  {
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
      "ray-x/lsp_signature.nvim",
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("lsp.saga")
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      }
    }
  },
  {
    "j-hui/fidget.nvim",
    config = true,
    init = lazyLoad("fidget.nvim"),
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function ()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      require("completion.cmp")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = true,
    event = "InsertEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("editor.gitsigns")
    end,
    init = lazyLoad("gitsigns.nvim"),
  },
  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = function()
      require("ui.heirline")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("editor.leap")
    end,
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("tools.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    event = "VeryLazy"
  },
  {
    "thePrimeagen/harpoon",
    config = function()
      require("tools.harpoon")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("plugins.configs.mini")
    end,
    init = lazyLoad("mini.nvim"),
  },
  {
    "lukas-reineke/headlines.nvim",
    config = true,
    ft = {
      "md",
    },
  },
  {
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
  },
  {
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
  },
  {
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
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    keys = {
      { "<leader>so", "<cmd>SymbolsOutline<cr>" }
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
    },
    config = function()
      require("dap.dap")
    end,
    keys = function()
      local dap = require("dap")
      return {
        { "<leader>dtb", function() dap.toggle_breakpoint() end },
        { "<leader>dc", function() dap.continue() end },
        { "<leader>dso", function() dap.step_over() end },
        { "<leader>dsi", function() dap.step_into() end },
        {"<leader>dui", function() require("dap.ui.widgets").hover() end },
        {"<leader>dls", function() require("osv").launch({ port = 8086 }) end },
        {"<leader>ort", function() require("osv").run_this() end },
      }
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = lazyLoad("null-ls.nvim"),
    config = function ()
      require("lsp.null")
    end,
  },
}

require("lazy").setup({
  plugins,
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
    reset_packpath = true,
    cache = {
      enabled = true,
    },
  },
  install = {
    colorscheme = { "catppuccin" }
  },
  defaults = {
    lazy = true,
  },
})

