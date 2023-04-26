local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

autocmd("InsertEnter", {
  callback = function()
    o.relativenumber = false
  end
})

autocmd("InsertLeave", {
  callback = function()
    o.relativenumber = true
  end
})

autocmd({ "BufRead", "BufNewFile", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. "LSP", {}),
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "LSP" })
      vim.cmd("silent! do FileType")
    end)
    vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. "LSP")
  end,
})
