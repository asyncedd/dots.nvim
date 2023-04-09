local conditions = require("heirline.conditions")
local M = {}

M.LSPActive = {
  condition = conditions.lsp_attached,
  update = {
    "LspAttach",
    "LspDetach"
  },

  -- You can keep it simple,
  -- provider = " [LSP]",

  -- Or complicate things a bit and get the servers names
  provider  = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " " .. table.concat(names, " ")
  end,
  hl = function (self)
    return {
      fg = self:mode_color(),
      bold = true,
    }
  end
}

return M
