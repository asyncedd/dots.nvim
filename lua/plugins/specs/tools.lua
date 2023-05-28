-- lua/plugins/specs/tools.lua
--
--  ┌
--  │              Some tools for the best editor
--  └

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require("plugins.configs.tools.telescope")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

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
    },
    keys = {
      -- { "<leader>ff", "<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true })<CR>", desc = "Find files" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find grep" },
      { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>>", desc = "Fuzzy find in buffer" },
    },
    cmd = "Telescope",
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
    end,
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
}
