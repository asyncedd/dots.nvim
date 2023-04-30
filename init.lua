-- Enable the experimental new loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Require lazy.nvim.
require("plugins")

-- Catppuccinify the editor.
vim.cmd("colorscheme catppuccin")
