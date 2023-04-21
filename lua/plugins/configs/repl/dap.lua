-- Lua (one-step-for-vimkind plugin)
require("dap").configurations.lua = {
  { type = "nlua", request = "attach", name = "Attach to running Neovim instance" },
}

require("dap").adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

-- SIGN-COLUMN ICONS
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "", texthl = "DiagnosticHint" })
sign("DapBreakpointCondition", { text = "", texthl = "DiagnosticHint" })
sign("DapLogPoint", { text = "󰍨", texthl = "DiagnosticHint" })
sign("DapStopped", { text = "", texthl = "DiagnosticInfo" })
sign("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
