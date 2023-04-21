local TabLineOffset = require("ui.heirline.tabline.tablistoffset")
local BufferLine = require("ui.heirline.tabline.bufferline")
local TabPages = require("ui.heirline.tabline.tablist")


-- Some cool heirline stuff:
-- Yep, with heirline we're driving manual!
vim.opt.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

return { TabLineOffset, BufferLine, TabPages }

