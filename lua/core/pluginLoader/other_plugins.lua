local vim = vim
local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup("lazyload_" .. name, { clear = true })
end

vim.defer_fn(function()
  -- require("configs.ui.animate")
  require("configs.ui.indent")
  require("configs.ui.matcher")
  require("configs.editor.comment")
  require("configs.editor.motion")
  api.nvim_create_autocmd({ "BufReadPost" }, {
    group = augroup("editor"),
    callback = function()
      pcall(require, "configs.ui.indent")
      pcall(require, "configs.ui.matcher")
      pcall(require, "configs.editor.comment")
    end
  })
end, 1000)
