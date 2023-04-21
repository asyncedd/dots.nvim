local M = {}
local Space = {
  condition = function(self)
    return self.has_changes
  end,
  provider = " ",
}
local conditions = require("heirline.conditions")

M.Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "orange" },

  { -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  Space,
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "git_add" },
  },
  Space,
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "git_del" },
  },
  Space,
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. count)
    end,
    hl = { fg = "git_change" },
  },
  Space,
}

return M
