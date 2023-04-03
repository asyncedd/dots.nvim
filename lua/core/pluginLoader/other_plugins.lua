local vim = vim
local api = vim.api

vim.defer_fn(function()
  api.nvim_create_autocmd({ "BufReadPost" }, {
    -- require("configs.ui.animate")  api.nvim_create_autocmd({ "BufReadPost" }, {
    callback = function()
      require("configs.editor.motion")
      require("configs.ui.indent")
      require("configs.ui.matcher")
      require("configs.editor.comment")
      require("configs.editor.gitsigns")
    end
  })
end, 1000)
