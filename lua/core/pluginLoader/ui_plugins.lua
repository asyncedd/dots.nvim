local vim = vim -- Avoid using expensive global searching.
local api = vim.api
local o = api.nvim_set_option_value

local function augroup(name)
  return api.nvim_create_augroup("lazyload_" .. name, { clear = true })
end

local threads = {}

table.insert(threads, coroutine.create(function()
  api.nvim_command("colorscheme catppuccin")
end))

table.insert(threads, coroutine.create(function()
  api.nvim_create_autocmd({ "BufReadPost" }, {
    group = augroup("ui"),
    callback = function()
      local module_names = {
        "configs.editor.treesitter",
        "configs.ui.indent",
        "configs.ui.heirline",
        "colorizer",
        "configs.editor.ufo"
      }

      -- Load modules asynchronously using pcall
      for _, name in ipairs(module_names) do
        vim.schedule(function()
          pcall(require, name)
        end)
      end
    end
  })
end))


for i, thread in ipairs(threads) do
  coroutine.resume(thread)
end
