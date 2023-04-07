return {
  {
    "catppuccin/nvim",
    config = function()
      require("plugins.configs.ui.catppuccin")
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      require("plugins.configs.ui.map")
    end,
    event = "VeryLazy",
  },
}
