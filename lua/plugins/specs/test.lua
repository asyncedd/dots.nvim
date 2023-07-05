return {
  {
    "nvim-neotest/neotest",
    opts = {},
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
      },
      {
        "<leader>ts",
        function()
          require("neotest").run.stop()
        end,
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
      },
    },
  },
}
