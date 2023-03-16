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

-- Now we're going to initalize lazy.nvim
require("plugins.configs.core.lazy")
