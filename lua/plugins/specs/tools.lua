local tools = {}

tools[1] = {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("tools.telescope")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "AckslD/nvim-neoclip.lua",
      dependencies = {
        {
          "kkharji/sqlite.lua",
          module = "sqlite",
        },
        -- you'll need at least one of these
        -- {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
      },
      config = function()
        require("neoclip").setup({
          history = 100000,
          enable_persistent_history = true,
          length_limit = 1048576,
          continuous_sync = true,
          db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        })
      end,
    },
    "olimorris/persisted.nvim",
  },
  event = "VeryLazy",
}

tools[2] = {
  "thePrimeagen/harpoon",
  config = function()
    require("tools.harpoon")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
}

tools[3] = {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("tools.nvimtree")
  end,
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
  },
}

tools[4] = {
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

tools[5] = {
  "TimUntersberger/neogit",
  cmd = { "Neogit" },
  config = true,
  keys = {
    {
      "<leader>gt",
      function()
        require("neogit").open({ kind = "split" })
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

tools[6] = {
  "rafcamlet/nvim-luapad",
  lazy = true,
  cmd = {
    "Luapad",
    "LuaRun",
    "Lua",
  },
}

tools[7] = {
  "sindrets/diffview.nvim",
  config = true,
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<cr>" },
  },
}

tools[8] =
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  }, {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>" },
    },
  }

tools[9] = {
  "pwntester/octo.nvim",
  config = true,
  cmd = {
    "Octo",
  },
  keys = {
    { "<leader>gh", ":Octo " },
  },
}

tools[10] = {
  "ibhagwan/fzf-lua",
  -- config = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  build = "fzf#install()",
  keys = {
    { "<leader>gr", "<cmd>FzfLua grep<cr>" },
    { "<leader>sw", "<cmd>FzfLua grep_cword<cr>" },
    { "<leader>sW", "<cmd>FzfLua grep_cWORD<cr>" },
    { "<leader>sv", "<cmd>FzfLua grep_visual<cr>", mode = "v" },
    { "<leader>lr", "<cmd>FzfLua live_grep_native<cr>" },
    { "<leader>lr", "<cmd>FzfLua lsp_references<cr>" },
    { "<leader>ld", "<cmd>FzfLua lsp_definitions<cr>" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>" },
    { "<leader>gb", "<cmd>FzfLua git_bcommits<cr>" },
    { "<leader>br", "<cmd>FzfLua git_branches<cr>" },
  },
}

tools[11] = {
  "olimorris/persisted.nvim",
  config = function()
    require("tools.persisted")
  end,
  event = { "VeryLazy" },
}

tools[12] = {
  "lewis6991/impatient.nvim",
  lazy = false,
}

return tools
