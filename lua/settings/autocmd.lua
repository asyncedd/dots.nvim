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
