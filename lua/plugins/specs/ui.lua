return {
  -- Colorscheme
  "catppuccin/nvim",
  -- Indent blanklines
  "lukas-reineke/indent-blankline.nvim",
  -- Colorizer
  "NvChad/nvim-colorizer.lua",
  -- Heirline
  "rebelot/heirline.nvim",
  -- Folding
  "anuvyklack/pretty-fold.nvim",
  -- Cursorword
  "echasnovski/mini.cursorword",
  -- Indentscope
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function (_, opts)
      require("mini.indentscope").setup(opts)
    end,
    event = "BufReadPost",
  }
}
