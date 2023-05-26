local autocmd = vim.api.nvim_create_autocmd

-- ShaDa does save the last location of a buffer so, we can use that information to go back!
-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- When a LSP server is attached, we'll set the vim.g.lsp_attached global to true.
-- Then, we can use that for heirline to determine if there's a LSP server that is attached.
autocmd("LSPAttach", {
  callback = function()
    vim.g.lsp_attached = true
  end,
})
