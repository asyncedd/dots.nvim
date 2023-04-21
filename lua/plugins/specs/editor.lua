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
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
    },
  },
  {
    "andymass/vim-matchup",
    config = function()
      -- Don't show the matchup's matchparen.
      vim.g.matchup_matchparen_offscreen = { method = "off" }
    end,
    init = lazyLoad("vim-matchup"),
  },
  {
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
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
          {
            "honza/vim-snippets",
            config = function()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end,
          },
        },
        config = function()
          local snippet_path = vim.fn.stdpath("config") .. "/snips/"
          if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
            vim.opt.rtp:append(snippet_path)
          end

          require("luasnip").config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            delete_check_events = "TextChanged,InsertLeave",
          })

          require("luasnip.loaders.from_lua").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      },
      {
        "onsails/lspkind.nvim",
        config = function()
          require("lspkind").init({
            -- DEPRECATED (use mode instead): enables text annotations
            --
            -- default: true
            -- with_text = true,

            -- defines how annotations are shown
            -- default: symbol
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = "symbol_text",

            -- default symbol map
            -- can be either 'default' (requires nerd-fonts font) or
            -- 'codicons' for codicon preset (requires vscode-codicons font)
            --
            -- default: 'default'
            preset = "codicons",

            -- override preset symbols
            --
            -- default: {}
            symbol_map = {
              Text = "",
              Method = "",
              Function = "",
              Constructor = "",
              Field = "ﰠ",
              Variable = "",
              Class = "ﴯ",
              Interface = "",
              Module = "",
              Property = "ﰠ",
              Unit = "塞",
              Value = "",
              Enum = "",
              Keyword = "",
              Snippet = "",
              Color = "",
              File = "",
              Reference = "",
              Folder = "",
              EnumMember = "",
              Constant = "",
              Struct = "פּ",
              Event = "",
              Operator = "",
              TypeParameter = "",
            },
          })
        end,
      },
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
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
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
      {
        "<leader>cb",
        function()
          require("comment-box").lcbox(10)
        end,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    config = function()
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
  {
    "gbprod/yanky.nvim",
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
      { "<c-n>", "<Plug>(YankyCycleForward)", mode = { "n", "x" } },
      { "<c-p>", "<Plug>(YankyCycleBackward)", mode = { "n", "x" } },
    },
    config = true,
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          }, -- Manages Neorg workspaces
        },
      })
    end,
    ft = { "norg" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
    },
    config = function()
      require("editor.ufo")
    end,
    event = "VeryLazy",
  },
  {
    "sbdchd/neoformat",
    cmd = {
      "Neoformat",
    },
  },
}
