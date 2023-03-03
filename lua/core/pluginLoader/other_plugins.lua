local vim = vim
local api = vim.api

vim.defer_fn(function()
  -- require("configs.ui.animate")  api.nvim_create_autocmd({ "BufReadPost" }, {
  require("plugins.configs.editor.motion")
  require("plugins.configs.ui.indent")
  require("plugins.configs.ui.matcher")
  require("plugins.configs.editor.comment")
end, 1000)
