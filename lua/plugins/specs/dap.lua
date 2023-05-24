-- lua/plugins/specs/dap.lua
--
--  ┌
--  │              Plugins for debugging purposes
--  └

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "one-small-step-for-vimkind",
      "nvim-dap-ui",
      "nvim-dap-virtual-text",
    },
    config = function()
      require("plugins.configs.dap.nvim")
    end,
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    config = function()
      require("plugins.configs.dap.osv")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = true,
    config = function(_, opts)
      return require("plugins.configs.dap.ui")(_, opts)
    end,
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({ })
        end,
        desc = "UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "x" },
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = true,
  },
}
