local dap = require("dap")

dap.configurations.lua = ({
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  },
})

dap.adapters.nlua = function(callback, config)
  callback({
    type = 'server',
    host = config.host or "127.0.0.1",
    port = config.port or 8086,
  })
end

local keymap = vim.keymap.set

keymap("n", "<leader>dtb", function() dap.toggle_breakpoint() end, { noremap = true })
keymap("n", "<leader>dc", function() dap.continue() end, { noremap = true })
keymap("n", "<leader>dso", function() dap.step_over() end, { noremap = true })
keymap("n", "<leader>dsi", function() dap.step_into() end, { noremap = true })
keymap("n", "<leader>dui", function() require("dap.ui.widgets").hover() end, { noremap = true })
keymap("n", "<leader>dls", function() require("osv").launch({ port = 8086 }) end, { noremap = true })
keymap("n", "<leader>ort", function() require("osv").run_this() end, { noremap = true })

