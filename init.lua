-- Neoinit v2.0

-- Set options.
require("settings.options")

-- Create some autocommands.
require("settings.autocmd")

-- Setup lazy.nvim
require("plugins")

-- Enable the catppuccin colorshceme
vim.api.nvim_command("colorscheme catppuccin")

-- Defer time-consuming tasks later.
vim.defer_fn(function()
  require("core.after")
end, 0)
