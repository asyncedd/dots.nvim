-- Enable the experimental new loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Require lazy.nvim.
require("plugins")

-- Catppuccinify the editor.
-- vim.cmd("colorscheme catppuccin")
-- PERF: directly call catppuccin. (not via `vim.cmd("colorscheme x")`)
-- HACK: Try to make this less hacky?
require("catppuccin").load()

vim.schedule(function()
  -- TODO: Find a better way to load keymaps?
  require("keymaps")
  -- Set up highlights.
  require("core.utils.hl")
end)
