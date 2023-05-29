-- lua/plugins/specs/editor.lua
--
--  ┌
--  │             Plugins for enhancing the editor
--  └

return {
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
      require("core.utils.lazy")("gitsigns.nvim")
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
    "zdharma-continuum/zinit-vim-syntax",
    ft = "zsh",
  },
  {
    "fladson/vim-kitty",
    ft = {
      "kitty",
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
    opts = true,
    keys = {
      { "<leader>gcc", "<cmd>CBccbox<CR>", desc = "Center aligned comment box", mode = { "x", "n" } },
      { "<leader>gca", "<cmd>CBacbox<CR>", desc = "Center adapted comment box", mode = { "x", "n" } },
      { "<leader>gch", "<cmd>CBllbox<CR>", desc = "Left aligned comment box", mode = { "x", "n" } },
      { "<leader>gcl", "<cmd>CBrrbox<CR>", desc = "Right aligned comment box", mode = { "x", "n" } },
      {
        "<leader>gco",
        "<cmd>lua require('comment-box').catalog()<CR>",
        desc = "Open comment box catolog",
        mode = { "x", "n" },
      },
      { "<leader>gcp", ":CBcbox ", desc = "Pick comment box" },
    },
  },
}
