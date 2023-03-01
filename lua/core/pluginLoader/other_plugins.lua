local vim = vim
local api = vim.api

vim.defer_fn(function()
  -- require("configs.ui.animate")  api.nvim_create_autocmd({ "BufReadPost" }, {
  print("hi")
  require("configs.editor.motion")
  require("configs.ui.indent")
  require("configs.ui.matcher")
  require("configs.editor.comment")
  require("configs.editor.gitsigns")
end, 1000)
