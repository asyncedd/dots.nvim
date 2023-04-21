local vim = vim
local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup("lazyload_" .. name, { clear = true })
end


api.nvim_create_autocmd({ "BufReadPost" }, {
  group = augroup("editor"),
  callback = function()
    vim.defer_fn(function()
      local module_names = {
        "configs.ui.indent",
        "configs.ui.matcher",
        "configs.editor.comment",
        "configs.editor.motion"
      }

      -- Load modules asynchronously using pcall
      for _, name in ipairs(module_names) do
        vim.schedule(function()
          pcall(require, name)
        end)
      end
    end, 1000)
  end
})

