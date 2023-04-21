return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    config = function ()
      vim.cmd("colorscheme catppuccin")
    end,
    event = "VimEnter"
  },
  -- Indent blanklines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    event = "BufReadPost"
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "BufReadPost"
  },
  -- CCC.nvim
  {
    "uga-rosa/ccc.nvim",
    config = true,
    event = "BufReadPost"
  },
  -- Heirline
  {
    "rebelot/heirline.nvim",
    config = function ()
      require("plugins.configs.ui.heirline")
    end,
    event = { "BufReadPost", "VeryLazy" }
  },
  -- Cursorword
  {
    "echasnovski/mini.cursorword",
    config = function ()
      require("mini.cursorword").setup()
    end,
    event = "BufReadPost",
  },
  -- Indentscope
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function ()
      require("mini.indentscope").setup()
    end,
    event = "BufReadPost"
  },
}
