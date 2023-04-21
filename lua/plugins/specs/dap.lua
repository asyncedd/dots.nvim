return {
  -- Nvim-DAP - Debug 1.5% more faster!
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = require("dap.dapUi"),
      },
      "nvim-treesitter/nvim-treesitter",
      "folke/neodev.nvim",
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "nvim-dap",
        opts = { automatic_setup = true },
        config = function (_, opts)
          require("mason-nvim-dap").setup(opts)
          require("mason-nvim-dap").setup_handlers({})
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
          "mfussenegger/nvim-dap",
        },
        config = require("dap.dap-vt"),
        event = "VeryLazy"
      },

    },
    config = require("dap.dap"),
    event = "VeryLazy"
  },
}
