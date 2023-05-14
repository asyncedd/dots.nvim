return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rust-tools.nvim",
      "mason-nvim-dap.nvim",
      "nvim-dap-ui",
    },
    keys = {
      { "<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Contine" },
      { "<leader>do", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
      { "<leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
      { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>", desc = "Set breakpoint" },
      { "<leader>dr", "<cmd>lua require('dap').repl_toggle<CR>", desc = "Toggle REPL" },
      { "<leader>dl", "<cmd>lua require('dap').run_last<CR>", desc = "Run last" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason.nvim",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "x" } },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}
