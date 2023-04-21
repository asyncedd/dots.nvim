return function()
  local dap = require("dap")
  local keymap = vim.keymap.set

  keymap("n", "<leader>db", function ()
    dap.toggle_breakpoint()
  end)

  keymap("n", "<leader>dc", function ()
    dap.continue()
  end)

  keymap("n", "<leader>so", function ()
    dap.step_over()
  end)

  keymap("n", "<leader>si", function ()
    dap.step_in()
  end)

  keymap("n", "<leader>ro", function ()
    dap.repl.open()
  end)
end
