local conditions = require("heirline.conditions")
local M = {}

M.LSPActive = {
  condition = conditions.lsp_attached,
  update = {
    "LspAttach",
    "LspDetach",
    "ModeChanged",
  },

  -- You can keep it simple,
  -- provider = " [LSP]",

  -- Or complicate things a bit and get the servers names
  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " " .. table.concat(names, " ")
  end,
  hl = function(self)
    return {
      fg = self:mode_color(),
      bold = true,
    }
  end,
}

local icons = require("core.utils.icons")

M.Diagnostics = {

  condition = conditions.has_diagnostics,

  static = {
    error_icon = icons.Error,
    warn_icon = icons.Warn,
    info_icon = icons.Info,
    hint_icon = icons.Hint,
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = {
    "DiagnosticChanged",
    "BufEnter",
  },

  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
}

return M
