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
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "sbdchd/neoformat",
    config = function()
      vim.g.neoformat_run_all_formatters = 1

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.cmd("Neoformat")
        end,
      })
    end,
    cmd = "Neoformat",
    event = "VeryLazy",
  },
}
