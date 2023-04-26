return {
  {
    "TimUntersberger/neogit",
    opts = {
      disable_commit_confirmation = true,
    },
    config = true,
    keys = {
      { "<leader>gt", "<cmd>Neogit<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
