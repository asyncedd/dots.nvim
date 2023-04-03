-- Bootstrap lazy.nvim
-- This should be quite straight-foward:
-- If lazy isn't installed, install it.
--
-- Check if it exists
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If it doesn't, clone it.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- And then, prepend it the runtime plugins list.
vim.opt.rtp:prepend(lazypath)

local icons = require("core.utils.icons.lazy")

-- Now we're going to initalize lazy.nvim
require("lazy").setup({
  -- First, we're going to get the specs table from a directory.
 require("plugins.specs"),
  -- Next is the options for lazy.nvim
}, {
  performance = {
    rtp = {
      -- We're going to disable some runtime plugins that we don't need.
      disabled_plugins = {
        "2html_plugin",
        -- "getscript",
        -- "getscriptPlugin",
        -- "logipat",
        -- "netrwFileHandlers",
        -- "loaded_remote_plugins",
        -- "loaded_tutor_mode_plugin",
        -- "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "tohtml",
        -- "shada",
        "spellfile",
      },
    },
  },
  ui = {
    -- size = { width = 0.8, height = 0.8 },
    -- We're gonna make the GUI (actually, it's a TUI) curved!
    -- Look at those curves! (WTF. Add +1 to the WTF/Min)
    border = "rounded",
    -- I dunno, lazy.nvim doesn't really seem to find this so here, uwu!
    icons = {
      lazy = icons.lazy,
    },
    -- throttle = 50,
  },
  install = {
    -- When we're installing plugins it'll default to the habamax colorscheme but, we like our catppuccino mocha catppuccin so we're going to default to that.
    -- And also Tokyonight.nvim, even though we don't have it installed (+1 WTF/min)
    colorscheme = { "catppuccin", "tokyonight", "habamx" },
  },
  -- Oh yeah, we're going to lazy-laod every plugin by default.
  -- because I'm too lazy to add that 12 characters!
  -- (+1 WTF/Min)
  defaults = {
    lazy = true,
  },
})
