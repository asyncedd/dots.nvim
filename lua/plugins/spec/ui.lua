return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      show_end_of_line = true,
      space_char_blankline = " ",
      enabled = true,
      colored_indent_levels = false,
      show_trailing_blankline_indent = true,
    },
    event = "BufReadPost",
    config = true,
  },
  {
    "monkoose/matchparen.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.configs.ui.heirline")
    end
  },
}
