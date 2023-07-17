local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  print(" Bootstrapping lazy.nvim!")
  vim.cmd("!git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)
  print(" Done!")
end

vim.opt.rtp:prepend(lazypath)
