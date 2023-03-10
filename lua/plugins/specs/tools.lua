return {
  -- Tools
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" }
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("plugins.configs.tools.tree")
    end,
    event = "VeryLazy"
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  }
}
