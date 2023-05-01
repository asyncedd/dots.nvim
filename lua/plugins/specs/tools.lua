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
        pattern = "NeogitCommitMessage";
        command = "silent! set filetype=gitcommit",
      })
    end,
    keys = {
      { "gt", "<cmd>Neogit<CR>" },
    },
  },
}
