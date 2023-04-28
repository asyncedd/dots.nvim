-- Neoinit

-- Enable the new experimental vim.loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Enable lazy.nvim
require("plugins")

-- Set the colorscheme to catppuccin.
vim.api.nvim_command("colorscheme catppuccin")
