local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "jayp0521/mason-nvim-dap.nvim", config = true },
      { "theHamsta/nvim-dap-virtual-text", config = true },
      { "rcarriga/nvim-dap-ui", config = true },
      "jbyuki/one-small-step-for-vimkind", -- lua debugger specifically for neovim config
    },
    config = function()
      require("repl.dap")
    end,
    keys = {
      {
        "<leader>bu",
        function()
          require("dapui").toggle()
        end,
      },
      {
        "<leader>bv",
        function()
          require("dap").step_over()
        end,
      },
      {
        "<leader>bo",
        function()
          require("dap").step_out()
        end,
      },
      {
        "<leader>bi",
        function()
          require("dap").step_into()
        end,
      },
      {
        "<leader>bc",
        function()
          require("dap").run_to_cursor()
        end,
      },
      {
        "<leader>bp",
        function()
          require("dap").toggle_breakpoint()
        end,
      },
      {
        "<leader>br",
        function()
          require("dap").clear_breakpoints()
        end,
      },
      {
        "<leader>bq",
        function()
          require("dap").list_breakpoints()
        end,
      },
      {
        "<leader>bl",
        function()
          require("dap").run_last()
        end,
      },
      {
        "<leader>bt",
        function()
          vim.opt_local.number = false
          require("dapui").close()
          require("dap").terminate()
        end,
      },
      {
        "<leader>bn",
        function()
          vim.opt_local.number = true
          -- INFO is the only one that needs manual starting, other debuggers
          -- start with `continue` by themselves
          if require("dap").status() ~= "" then
            vim.notify("Debugger already running.")
            return
          end
          if not vim.bo.filetype == "lua" then
            vim.notify("Not a lua file.")
            return
          end
          require("osv").run_this()
        end,
      },
    },
  },
}
