local ffi = require("ffi")
local uv = vim.loop

local M = {}

M.path = vim.fn.stdpath("cache") .. "/lazy/luac"

return M
