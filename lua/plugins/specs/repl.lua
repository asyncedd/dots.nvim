return {
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    cmd = {
      "SnipRun",
      "SnipInfo",
      "SnipClose",
      "SnipReplMemoryClean",
      "SnipReset",
    },
    keys = {
      { "<leader>sp", ":SnipRun<cr>", mode = { "v", "n" } },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      {
        "<leader>bp",
        function()
          require("dap").toggle_breakpoint()
        end,
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
      },
      {
        "<leader>so",
        function()
          require("dap").step_over()
        end,
      },
      {
        "<leader>si",
        function()
          require("dap").step_into()
        end,
      },
      {
        "<leader>uh",
        function()
          require("dap.ui.widgets").hover()
        end,
      },
      {
        "<leader>ol",
        function()
          require("osv").launch({ port = 8086 })
        end,
      },
      {
        "<leader>runit",
        function()
          require("osv").run_this()
        end,
      },
    },
    config = function()
      require("dap.dap")
    end,
  },
}
