-- Enable the experimental Lua loader.
--
-- What it does is:
-- - Overrides loadfile
-- - Adds the Lua loader using the byte-compilation cache
-- - Adds the libs loader
-- - Removes the default Neovim loader
--
-- The default Neovim loader is:
-- https://neovim.io/doc/user/starting#initialization
--
-- This only starts from step 7 in the initialization process.
vim.loader.enable()

-- Check it at lua/settings/options.lua as I've documented heavily
-- Set some options.
require("settings.options")

-- Require lazy.nvim.
require("plugins")

-- Set up autocmds
require("settings.autocmds")

-- Catppuccinify the editor.
-- vim.cmd("colorscheme catppuccin")
-- PERF: directly call catppuccin. (not via `vim.cmd("colorscheme x")`)
-- HACK: Try to make this less hacky?

-- In Catppuccin, the colorscheme file is a Lua block (via vimscript) that requires the exact same thing.
-- So, by doing this we can optimize whilst not loosing maintainability.
require("catppuccin").load()

-- Execute "Colorscheme" autocommands as they may be needed
vim.api.nvim_exec_autocmds("Colorscheme", {})

vim.schedule(function()
  -- TODO: Find a better way to load keymaps?
  require("keymaps")
end)
