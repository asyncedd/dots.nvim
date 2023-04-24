-- Lua (one-step-for-vimkind plugin)
local dap = require("dap")

dap.adapters.nlua = function(callback, config)
  callback({
    type = "server",
    host = config.host,
    port = config.port or 5005,
  })
end

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "nlua attach",
    host = "127.0.0.1",
    port = function()
      local val = tonumber(vim.fn.input("Port: "))
      return val
    end,
  },
}

-- SIGN-COLUMN ICONS
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "", texthl = "DiagnosticHint" })
sign("DapBreakpointCondition", { text = "", texthl = "DiagnosticHint" })
sign("DapLogPoint", { text = "󰍨", texthl = "DiagnosticHint" })
sign("DapStopped", { text = "", texthl = "DiagnosticInfo" })
sign("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
