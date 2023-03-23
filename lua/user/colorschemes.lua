return {
  {
    "catppuccin/nvim",
    config = function()
      require("ui.catppuccin")
    end,
  },
  "FrenzyExists/aquarium-vim",
  {
    "wuelnerdotexe/vim-enfocado",
    config = function ()
      vim.g.enfocado_style = "nature" -- You can go for "neon" too.
    end,
  },
}
