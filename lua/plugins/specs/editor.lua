return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      require("plugins.highlight.editor.treesitter")
    end,
    build = ":TSUpdate",
    event = { "BufReadPost" },
  },
  {
    "andymass/vim-matchup",
    opts = function()
      return require("plugins.configs.editor.matchup")
    end,
    config = function(_, opts)
      vim.schedule(function()
        require("nvim-treesitter.configs").setup(opts)

        vim.cmd("silent! do FileType")
      end)
    end,
    event = { "VeryLazy", "User file" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require("plugins.configs.editor.gitsigns")
    end,
    config = true,
    event = { "VeryLazy", "BufRead", "User file" },
  },
  {
    "folke/todo-comments.nvim",
    config = true,
    event = { "VeryLazy", "BufRead", "User file" },
  },
  {
    "folke/which-key.nvim",
    opts = function()
      return require("plugins.configs.editor.which_key")
    end,
    config = function(_, opts)
      require("which-key").setup(opts)

      require("plugins.configs.editor.wk")
    end,
    event = { "VeryLazy" },
  },
}
