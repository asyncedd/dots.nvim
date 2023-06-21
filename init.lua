-- init.lua
--
-- 2023 Async hronous
--
-- The code provided below is licenced on the Unlicense licence.
--
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
-- PERF: directly call the colorscheme. (not via `vim.cmd("colorscheme x")`)
-- lua blocks are expensive as I heard.
-- this actually seems like an unnessearu premature optimization though
-- HACK: Try to make this less hacky?

local colorscheme = require("settings.settings").colorscheme

if colorscheme == "catppuccin" or colorscheme == "onedarkpro" then
  -- In Catppuccin, the colorscheme file is a Lua block (via vimscript) that requires the exact same thing.
  -- So, by doing this we can optimize whilst not loosing maintainability.
  --
  -- for example:
  -- [
  -- # color/some_colorscheme.vim
  --
  -- lua >>
  -- require("some_colorscheme").load()
  --
  -- ]
  --
  -- For Catppuccin and Onedarkpro it's that.
  -- Because of that small typo of "onedark", we'll just go ahead and go fix it.
  require(colorscheme).load()
  -- In Tokyonight it needs a "_" for some reason so, we just put that in a "elseif" block.
elseif colorscheme == "tokyonight" then
  require("tokyonight")._load()
else
  -- If the colroscheme local doesn't match the ones in the if/elseif blocks,
  -- we'll just go ahead and `pcall` "vim.cmd.colorscheme" to try and load it.
  --
  -- We'll go and use the variable "ok".
  -- It'll be false if the colorscheme doesn't exist.
  -- It'll be true if it does.
  local ok = pcall(vim.cmd.colorscheme, colorscheme)
  --         ^^^^^ ^^^^^^^^^^^^^^^^^^^  ^^^^^^^^^^^
  --           │             │               │
  --           │             │               │
  --      protected call     │               │
  --                         │               │
  --        Define what function we want to do
  --                                         │
  --                                the colorscheme local.
  --                        Defined in `lua/settings/settings.colorscheme`
  --
  -- If it loads, we'll just go continue on, no problems :)
  if not ok then
    -- But if it doesn't we'll just go ahead and print that, "hey, there's no colorscheme named <colorscheme>"
    -- And, after that we'll just load catppuccin as a fallback.
    vim.notify("Unknown colorscheme.", vim.log.levels.ERROR, {})
    require("catppuccin").load()
  end
end

-- Execute "Colorscheme" autocommands as they may be needed
-- Some plugins may use this autocommand to synchronize the colorscheme.
--
-- This is normally executed when we do a "vim.cmd.colorscheme" so, how about we do that as well.
vim.api.nvim_exec_autocmds("Colorscheme", {})

-- The possibility of one pressing a keymap under a few ms is unlikely.
-- So, to improve responsiveness, we wrap it inside a vim.schedule function.
--
-- vim.schedule, schedules the function inside it to be involed soon by the main event-loop.
-- It's useful to avoid textlock or other temporary restrictions.
vim.schedule(function()
  require("keymaps")
end)
