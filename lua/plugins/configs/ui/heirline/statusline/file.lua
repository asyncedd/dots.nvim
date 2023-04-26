local M = {}
local utils = require("heirline.utils")

M.FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat

    if fmt == "unix" then
      return " "
    elseif fmt == "dos" then
      return " "
    elseif fmt == "mac" then
      return " "
    else
      return fmt:upper() .. " "
    end
  end,
  hl = { fg = "black" },
}

M.FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = "black", bold = true },
}

return utils.surround({ "", "" }, function(self) return self:mode_color() end, { M.FileFormat, M.FileType })
