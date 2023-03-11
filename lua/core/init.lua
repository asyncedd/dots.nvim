-- lua/core/init.lua
-- This is the place where the magic happens!

-- Set the <leader> key to: <Space>
-- So we can go for ex. -> `<leader>ff` to open Telescope.nvim.
-- Quite useful ain't it? :)
vim.g.mapleader = " "

-- Set some options.
-- Now, we can use shortcuts like `<leader>ff` to open Telescope.nvim.
-- This will make out lives much easier! :D
require("core.options")

-- Initalize the plugin manager, lazy.nvim.
-- We're gonna use the best tools for the job!
require("core.lazy")

-- Let's load some plugins!
-- We could do this in the plugins spec, but let's take the finest control!
require("plugins.loader")

-- Time to set out beautiful `catppuccin` colorscheme!
-- It's Clean, cute and customizable!
-- Perfect for our programming lives! As we need the highest quality coffee!
vim.cmd("colorscheme catppuccin")

-- Do some stuff that aren't required in our UI. (mappings, autocmd etc...)
-- Also without blocking the main thread for the maximum efficiency.
vim.schedule(function()
  -- Add some autocmds.
  -- Check it out, it's quite neat!
  require("core.autocmd")
  -- Add some mappings... We need these more maximum productivity!
  -- TODO merge `mappings.lspsaga` with `mappings.plugins`
  require("mappings.movement")
  require("mappings.lspsaga")
  require("mappings.plugins")
end)
