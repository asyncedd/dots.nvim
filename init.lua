-- Enable the experimental Lua loader.
vim.loader.enable()

-- Set some options.
require("settings.options")

-- Require lazy.nvim.
require("plugins")

-- Set up autocmds.
require("settings.autocmds")

-- Set the colorscheme.
local colorscheme = dots.colorscheme.current

local ok = pcall(vim.cmd.colorscheme, colorscheme)

if not ok then
  vim.notify("Hey, there's no colorscheme named " .. colorscheme, vim.log.levels.ERROR, {})
  require("catppuccin").load()
end

-- Execute "Colorscheme" autocommands.
vim.api.nvim_exec_autocmds("Colorscheme", {})

-- Schedule the keymaps to improve responsiveness.
vim.schedule(function()
  require("keymaps")
end)
