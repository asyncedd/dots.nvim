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
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.highlight.telescope")

      require("telescope").setup()
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function()
          -- To get fzf loaded and working with telescope, you need to call
          -- load_extension, somewhere after setup function:
          require("telescope").load_extension("fzf")
        end,
        build = "make",
      },
    },
    cmd = {
      "Telescope",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    },
  },
}
