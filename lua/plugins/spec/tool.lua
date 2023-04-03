local M = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" }
    }
  }
}

return M
