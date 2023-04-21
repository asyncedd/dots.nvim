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

M.FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    return enc:upper() .. " "
  end,
  hl = { fg = "black" },
}

M.FileType = {
  provider = function()
    return string.upper(vim.bo.filetype) .. " "
  end,
  hl = { fg = "black", bold = true },
}

M.FileSize = {
  provider = function()
    -- stackoverflow, compute human readable file size
    local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize < 1024 then
      return fsize..suffix[1]
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1]) .. " "
  end,
  hl = { fg = "black" },
}

return utils.surround({ "", "" }, function(self) return self:mode_color() end, { M.FileEncoding, M.FileFormat, M.FileType, M.FileSize })
