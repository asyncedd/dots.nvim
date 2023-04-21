local o = vim.opt
local g = vim.g

local M = {
  -- General

  -- Set the leader key to <Space>
  g.mapleader = " ",
  -- Set the shiftwidth to 2
  o.shiftwidth = 2,
  o.number = true, -- Enable line numbers
  o.undofile = true, -- Enable persistent undo's
  -- Don't store backup when overwriting the file,
  o.backup = false,
  o.writebackup = false,
  o.mouse = "a", -- Enable mouse for all modes
  -- Apperance
}

return M
