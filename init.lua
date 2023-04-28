-- Neoinit

-- Enable the new experimental vim.loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Create some autocmds.
require("settings.autocmd")

-- Enable lazy.nvim
require("plugins")

-- Set the colorscheme to catppuccin.
vim.api.nvim_command("colorscheme catppuccin")

-- Defer some functions later.
require("core.after")
