vim.go.loadplugins = false
-- Call setup
local deinpath = vim.fn.stdpath("cache") .. "dein"

if not vim.loop.fs_stat(deinpath) then
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/Shougo/dein.vim",
    -- "--branch=stable",
    deinpath
  })
end

vim.opt.rtp:prepend(deinpath)
-- require("core").setup()
