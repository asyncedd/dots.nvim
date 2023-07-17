local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  print(" Bootstrapping lazy.nvim!")
  vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)
  print(" Done!")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.specs" },
  { import = "plugins.specs.languages" },
},
{
  defaults = {
    lazy = dots.lazy.defaults.lazy,
  },
  install = {
    colorscheme = { dots.lazy.default_to_current_colorscheme and dots.colorscheme.enabled },
  },
})
