-- lua/plugins/specs/editor.lua
--
--  ┌
--  │             Plugins for enhancing the editor
--  └

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.schedule(function()
        require("nvim-treesitter.configs").setup({
          indent = {
            enable = true,
          },
        })
      end)
    end,
    init = function()
      require("core.utils.lazy_load")("nvim-treesitter")
    end,
    build = ":TSUpdate",
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = function()
      return require("plugins.configs.editor.ufo")
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require("plugins.configs.editor.gitsigns")
    end,
    config = true,
    init = function()
      require("core.utils.lazy_load")("gitsigns.nvim")
    end,
  },
  {
    "olimorris/persisted.nvim",
    opts = true,
    config = function(_, opts)
      require("persisted").setup(opts)

      vim.cmd("SessionStart")
    end,
    cmd = {
      "SessionLoad",
      -- Load all other Session commands when, "Session" is typed.
      -- Thus, providing autocompletion for other commands.
      "Session",
    },
    event = { "VeryLazy" },
  },
  {
    "echasnovski/mini.basics",
    opts = function()
      return require("plugins.configs.editor.basics")
    end,
    config = function(_, opts)
      require("mini.basics").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "zdharma-continuum/zinit-vim-syntax",
    ft = "zsh",
  },
  {
    "fladson/vim-kitty",
    ft = {
      "conf",
      "session",
      "kitty",
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
    opts = true,
    keys = {
      { "<leader>gcc", "<cmd>CBccbox<CR>", desc = "Center aligned comment box" },
      { "<leader>gca", "<cmd>CBacbox<CR>", desc = "Center adapted comment box" },
      { "<leader>gch", "<cmd>CBllbox<CR>", desc = "Left aligned comment box" },
      { "<leader>gcl", "<cmd>CBrrbox<CR>", desc = "Right aligned comment box" },
      { "<leader>gco", "<cmd>lua require('comment-box').catalog()<CR>", desc = "Open comment box catolog" },
      { "<leader>gcp", ":CBcbox ", desc = "Pick comment box" },
    },
  },
}
