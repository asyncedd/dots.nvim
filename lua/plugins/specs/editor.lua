local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = lazyLoad("nvim-treesitter"),
    config = function()
      require("editor.treesitter")
    end,
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "off" }
    end,
    init = lazyLoad("vim-matchup"),
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
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      {
        "jcdickinson/codeium.nvim",
        config = true,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = {
          "hrsh7th/nvim-cmp",
        },
      },
      "hrsh7th/cmp-nvim-lua",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("completion.cmp")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("editor.gitsigns")
    end,
    init = lazyLoad("gitsigns.nvim"),
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("plugins.configs.mini")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    init = lazyLoad("mini.nvim"),
    event = "InsertEnter",
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        function()
          require("spider").motion("w")
        end,
        { "n", "o", "x" },
      },
      {
        "e",
        function()
          require("spider").motion("e")
        end,
        { "n", "o", "x" },
      },
      {
        "b",
        function()
          require("spider").motion("b")
        end,
        { "n", "o", "x" },
      },
      {
        "ge",
        function()
          require("spider").motion("ge")
        end,
        { "n", "o", "x" },
      },
    },
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("editor.leap")
    end,
    dependencies = {
      "ggandor/flit.nvim",
      config = true,
      dependencies = "tpope/vim-repeat",
    },
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "LudoPinelli/comment-box.nvim",
    config = true,
    keys = {
      { "<leader>cb", function() require("comment-box").lcbox(10) end },
    },
  },
  {
    "windwp/nvim-autopairs",
    config = function ()
      require("editor.autopairs")
    end,
    event = "InsertEnter",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("editor.autotag")
    end,
    event = "InsertEnter",
  },
}

