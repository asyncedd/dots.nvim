-- Set the <leader> key to: <Space>
-- So we can go for ex. -> `<leader>ff` to open Telescope.nvim.
-- Quite useful ain't it? :)
vim.g.mapleader = " "

-- Set some options.
-- I tried setting all the options there so we can make it nice and clean :)
require("core.options")

-- Initalize lazy.nvim. The plugin manager we're using.
require("core.lazy")

-- Also we're going to load some plugins
-- Ofcourse we can go ahead and do that in out plugins spec (via core.lazy)
-- But, I want that find control so here we go!
require("plugins.loader")

-- Ofcourse, setting our beautiful `catppuccin` colorscheme.
-- It's clean and cute! (CC)
-- Plus it's customizable. (CCC)
-- So here it is!
vim.api.nvim_command("colorscheme catppuccin")

-- Do some stuff that aren't required in our UI. (mappings, autocmd etc...)
-- Also without blocking the main thread.
vim.schedule(function()
  -- Add some autocmds. You can checkit out!
  require("core.autocmd")
  -- Add some mappings...
  -- TODO merge `mappings.lspsaga` with `mappings.plugins`
  require("mappings.movement")
  require("mappings.lspsaga")
  require("mappings.plugins")
end)
