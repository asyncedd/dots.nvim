return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle },
    },
    event = "BufReadPost",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end },
      { "<leader>fb", function() require("telescope.builtin").buffers() end },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end },
    },
  },
  {
    "TimUntersberger/neogit",
    config = true,
    keys = {
      { "<leader>ng", function() require("neogit").open() end },
    },
  },
}
