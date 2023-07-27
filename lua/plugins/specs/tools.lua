return not dots.tools.enabled and {}
  or {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
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
