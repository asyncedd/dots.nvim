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
      { "gt", "<cmd>Neogit<CR>" },
    },
    cmd = "Neogit",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup()

      require("plugins.highlight.tools.telescope")
    end,
    dependencies = {
      "nvim-treesitter",
      "nvim-web-devicons",
      "nvim-telescope/telescope-fzf-native.nvim",
      "plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    },
    cmd = "Telescope",
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>" },
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
  {
    "kelly-lin/ranger.nvim",
    config = true,
    keys = {
      { "<leader>ef", function() require("ranger-nvim").open() end },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTree",
    },
    config = true,
    keys = {
      { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree Tree Toggle" },
    },
  },
}
