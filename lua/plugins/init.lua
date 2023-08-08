local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.notify(" Bootstrapping lazy.nvim!")
  vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)
  vim.notify(" Done!")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.specs" },
  { import = "plugins.specs.languages" },
}, {
  defaults = {
    lazy = dots.lazy.defaults.lazy,
  },
  install = {
    colorscheme = { dots.lazy.default_to_current_colorscheme and dots.UI.colorscheme.enabled },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "spellfile",
        "matchit",
        "matchparen",
      },
    },
  },
})
