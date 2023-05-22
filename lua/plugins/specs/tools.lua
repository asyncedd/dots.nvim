return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup()

      require("telescope").load_extension("fzf")

      require("telescope").load_extension("persisted")
    end,
    dependencies = {
      "nvim-treesitter",
      "nvim-web-devicons",
      "persisted.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "plenary.nvim",
      "smart-open.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true })<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find grep" },
      { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>>", desc = "Fuzzy find in buffer" },
    },
    cmd = "Telescope",
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Toggle Lazygit" },
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "plenary.nvim",
      "nvim-web-devicons",
      "nui.nvim",
    },
    cmd = {
      "Neotree",
    },
    keys = {
      { "<leader>tt", "<cmd>Neotree<CR>" },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = function()
      return require("plugins.configs.tools.aerial")
    end,
    config = true,
    cmd = {
      "AerialToggle",
    },
    keys = {
      { "<leader>cc", "<cmd>AerialToggle<CR>" },
    },
  },
  {
    "danielfalk/smart-open.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
    },
  },
}
