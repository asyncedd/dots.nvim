-- Enable the experimental new loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Require lazy.nvim.
require("plugins")

-- Catppuccinify the editor.
-- vim.cmd("colorscheme catppuccin")
require("catppuccin").load("mocha")

-- Set up highlights.
require("core.utils.hl")

vim.schedule(function()
  require("keymaps")
end)
