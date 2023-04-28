local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "file" })

      vim.cmd("silent! do FileType")
    end)
  end,
})
