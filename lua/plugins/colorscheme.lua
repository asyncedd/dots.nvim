return {
  {
    "catppuccin/nvim",
    config = function()
      vim.api.nvim_command("colorscheme catppuccin")
    end,
    lazy = false,
    piority = 1000
  },
  "rebelot/kanagawa.nvim",
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",
}
