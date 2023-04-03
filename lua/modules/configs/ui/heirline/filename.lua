local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- Use local variables to avoid repetitive function calls
local bufname = vim.api.nvim_buf_get_name(0)

local FileNameBlock = {
  init = function(self)
    self.filename = bufname
  end,
}

-- Modify FileName directly with a modifier component
local FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = function()
    local hl = { fg = utils.get_highlight("Directory").fg }
    if vim.bo.modified then
      hl.fg = "cyan"
      hl.bold = true
    end
    return hl
  end,
}

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}


local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "orange" },
  },
}

-- Use a for loop to add children to FileNameBlock
for _, child in ipairs({ FileIcon, FileName, FileFlags }) do
  table.insert(FileNameBlock, child)
end
table.insert(FileNameBlock, { provider = '%<' })


-- utils.surround({ "", "" }, "bright_bg", { FileNameBlock })
-- return FileNameBlock

return FileNameBlock
