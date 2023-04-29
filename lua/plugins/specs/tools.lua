return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return {
        extensions = {
          menu = require("plugins.configs.tools.telescope.menu"),
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function()
          require("telescope").load_extension("fzf")
        end,
        build = "make",
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
       keys = { { "<leader>fb", "<cmd>Telescope file_browser theme=dropdown<CR>" } },
      },
      {
        "octarect/telescope-menu.nvim",
        config = function()
          require("telescope").load_extension("menu")
        end,
        keys = { {"<leader>fm", "<cmd>Telescope menu theme=dropdown<CR>"} },
      },
    },
    config = function(_, opts)
      require("plugins.highlight.tools.telescope")

      require("telescope").setup(opts)
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>" },
      { "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>" },
    },
    cmd = { "Telescope" },
  },
}
