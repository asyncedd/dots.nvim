require("settings.options")
require("settings.autocmd")

vim.defer_fn(function()
  require("core.after")
end, 0)
