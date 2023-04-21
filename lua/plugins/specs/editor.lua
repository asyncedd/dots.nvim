local lazyLoad = require("core.utils.lazyLoad")

---@param plugin string
local fileLazyLoad = function(plugin, ft) -- CREDIT: NvChad.
  vim.api.nvim_create_autocmd({ "BufReadPre", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand("%:e")
      local condition = (file == ft)

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)
        require("lazy").load({ plugins = plugin })
      end
    end,
  })
end

local editor = {}

editor[1] = {
  "nvim-treesitter/nvim-treesitter",
  init = lazyLoad("nvim-treesitter"),
  config = function()
    require("editor.treesitter")
  end,
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  -- dependencies = {
  --   "HiPhish/nvim-ts-rainbow2",
  -- },
  event = "VeryLazy",
}

editor[2] = {
  "andymass/vim-matchup",
  config = function()
    -- Don't show the matchup's matchparen.
    vim.g.matchup_matchparen_offscreen = { method = "off" }
  end,
  init = lazyLoad("vim-matchup"),
}

editor[3] = {
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
        require("completion.luasnip")
      end,
    },
    {
      "onsails/lspkind.nvim",
      config = function()
        require("completion.lspkind")
      end,
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    {
      "jcdickinson/codeium.nvim",
      config = true,
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "jcdickinson/http.nvim",
          build = "cargo build --workspace --release",
        },
      },
    },
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      dependencies = {
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("completion.cmpTabnine")
      end,
    },
    "hrsh7th/cmp-nvim-lua",
    "windwp/nvim-autopairs",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
  },
  config = function()
    require("completion.cmp")
  end,
}

editor[4] = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("editor.gitsigns")
  end,
  init = lazyLoad("gitsigns.nvim"),
}

editor[5] = {
  "echasnovski/mini.nvim",
  config = function()
    require("plugins.configs.mini")
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  init = lazyLoad("mini.nvim"),
  event = "InsertEnter",
}

editor[6] = {
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
}

editor[7] = {
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
}

editor[8] = {
  "LeonHeidelbach/trailblazer.nvim",
  config = true,
  event = "VeryLazy",
}

editor[9] = {
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
}

editor[10] = {
  "windwp/nvim-autopairs",
  config = function()
    require("editor.autopairs")
  end,
  event = "InsertEnter",
}

editor[11] = {
  "windwp/nvim-ts-autotag",
  config = function()
    require("editor.autotag")
  end,
  event = "InsertEnter",
}

editor[12] = {
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
}

editor[13] = {
  "nvim-neorg/neorg",
  config = function()
    vim.schedule(function()
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
    end)
  end,
  ft = { "norg" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

editor[14] = {
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
}

editor[15] = {
  "sbdchd/neoformat",
  cmd = {
    "Neoformat",
  },
}

editor[16] = {
  "fladson/vim-kitty",
  init = function()
    fileLazyLoad("vim-kitty", "conf")
  end,
}

editor[17] = {
  "ThePrimeagen/refactoring.nvim",
  config = function()
    require("editor.refactoring")
  end,
  event = "BufWritePre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

editor[18] = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = true,
}

return editor
