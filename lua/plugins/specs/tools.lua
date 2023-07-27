return not dots.tools.enabled and {}
  or {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
        },
      },
      dependencies = "nvim-lua/plenary.nvim",
      keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
      },
      enabled = dots.tools.telescope.enabled,
    },
  }
