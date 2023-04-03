return {
  -- Nvim-DAP - Debug 1.5% more faster!
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-treesitter/nvim-treesitter",
      "folke/neodev.nvim",
    },
    config = require("dap.dap")
  },
  -- Nvim-DAP-vt - See some variables stuff in your editor!
  {
    "theHamsta/nvim-dap-virtual-text",
    config = require("dap.dap-vt")
  }
}
