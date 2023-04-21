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
    local co = coroutine
    co.resume(co.create(function()
      -- Don't show the matchup's matchparen.
      vim.g.matchup_matchparen_offscreen = { method = "off" }

      require("editor.treesitter")
    end))
  end,
  build = ":TSUpdate",
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
  },
  dependencies = {
    "andymass/vim-matchup",
  },
}

editor[2] = {
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

editor[3] = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("editor.gitsigns")
  end,
  init = lazyLoad("gitsigns.nvim"),
}

editor[4] = {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "w",
      function()
        require("spider").motion("w")
      end,
      mode = { "n", "v" },
    },
    {
      "e",
      function()
        require("spider").motion("e")
      end,
      mode = { "n", "v" },
    },
    {
      "b",
      function()
        require("spider").motion("b")
      end,
      mode = { "n", "v" },
    },
    {
      "ge",
      function()
        require("spider").motion("ge")
      end,
      mode = { "n", "v" },
    },
  },
}

editor[5] = {
  "ggandor/leap.nvim",
  config = function()
    require("editor.leap")
  end,
  dependencies = {
    "tpope/vim-repeat",
  },
  keys = {
    "s",
    "S",
    {
      "x",
      mode = { "v" },
    },
    {
      "X",
      mode = { "v" },
    },
  },
}

editor[6] = {
  "ggandor/flit.nvim",
  config = true,
  dependencies = {
    "tpope/vim-repeat",
    "ggandor/leap.nvim",
  },
  keys = {
    "f",
    "F",
    "t",
    "T",
  },
}

editor[7] = {
  "ggandor/leap-spooky.nvim",
  config = true,
  event = "VeryLazy",
}

editor[8] = {
  "LeonHeidelbach/trailblazer.nvim",
  config = true,
  keys = {
    "<A-l>",
    "<A-b>",
    "<A-J>",
    "<A-K>",
    "<A-n>",
    "<A-m>",
    "<A-L>",
    "<A-p>",
    "<A-P>",
    "<A-t>",
    "<A-.>",
    "<A-,>",
    "<A-s>",
    "<A-j>",
    "<A-k>",
  },
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

editor[13] = {
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

editor[14] = {
  "sbdchd/neoformat",
  cmd = {
    "Neoformat",
  },
}

editor[15] = {
  "fladson/vim-kitty",
  init = function()
    fileLazyLoad("vim-kitty", "conf")
  end,
}

editor[16] = {
  "echasnovski/mini.surround",
  keys = {
    "<leader>sa",
    "<leader>sd",
    "<leader>sr",
    "<leader>sf",
    "<leader>sF",
    "<leader>sh",
  },
  config = function()
    require("editor.surround")
  end,
}

editor[17] = {
  "numToStr/Comment.nvim",
  config = function()
    require("editor.Comment")
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  keys = {
    "gcc",
    "gbc",
    {
      "gc",
      mode = { "v", "n" },
    },
    {
      "gb",
      mode = { "v", "n" },
    },
    "gc0",
    "gco",
    "gcA",
  },
}

editor[18] = {
  "echasnovski/mini.ai",
  config = function()
    require("editor.ai")
  end,
  keys = {
    "vi",
    "va",
  },
}

editor[19] = {
  "echasnovski/mini.bracketed",
  keys = {
    "[",
    "]",
  },
  config = function()
    require("editor.bracketed")
  end,
}

editor[20] = {
  "echasnovski/mini.splitjoin",
  keys = { "gS" },
  config = function()
    require("editor.splitjoin")
  end,
}

editor[21] = {
  "echasnovski/mini.align",
  config = function()
    require("mini.align").setup()
  end,
  keys = {
    "ga",
  },
}

editor[22] = {
  "tpope/vim-repeat",
  event = "VeryLazy",
}

editor[22] = {
  "abecodes/tabout.nvim",
  config = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  keys = {
    "<Tab>",
    "<S-Tab>",
  },
}

return editor
