return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return {
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
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "telescope: find_files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "telescope: live_grep" },
    },
    cmd = {
      "Telescope",
    },
  },
  {
    "echasnovski/mini.files",
    opts = true,
    keys = {
      { "<leader>to", "<cmd>lua require('mini.files').open()<CR>", desc = "mini.files: Open" },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    opts = true,
    keys = {
      { "<leader>s", "<Cmd>lua require('spectre').toggle()<CR>" },
    },
  },
}
