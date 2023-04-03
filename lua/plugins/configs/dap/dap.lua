return function()
  local dap = require("dap")
  local keymap = vim.keymap.set

  dap.configurations.lua = ({
    {
      type = 'nlua',
      request = 'attach',
      name = "Attach to running Neovim instance",
    }
  })

  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
  end

  keymap("n", "<leader>db", function ()
    dap.toggle_breakpoint()
  end)

  keymap("n", "<leader>dc", function ()
    dap.continue()
  end)

  keymap("n", "<leader>so", function ()
    dap.step_over()
  end)
end
