return {
  {
    "rebelot/heirline.nvim",
    config = function()
      require("plugins.configs.ui.heirline")
    end,
    event = { "VeryLazy", "BufReadPost", "User Heirline" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
