return {
  {
    "TimUntersberger/neogit",
    opts = function()
      return require("plugins.configs.tools.neogit")
    end,
    config = function(_, opts)
      require("neogit").setup(opts)

      vim.api.nvim_create_augroup("neogit-additions", {})

      vim.api.nvim_create_autocmd("FileType", {
        group = "neogit-additions",
        pattern = "NeogitCommitMessage",
        command = "silent! set filetype=gitcommit",
      })
    end,
    keys = {
      { "gt", "<cmd>Neogit<CR>", desc = "Toggle Neogit" },
    },
    cmd = "Neogit",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup()
    end,
    dependencies = {
      "nvim-treesitter",
      "nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find grep" },
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
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = true,
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
}
