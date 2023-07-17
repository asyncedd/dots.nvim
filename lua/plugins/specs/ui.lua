return {
  dots.colorscheme.specs,
  {
    "catppuccin/nvim",
    optional = true,
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", {
        custom_highlights = function(C)
          return {
            ["@variable"] = { fg = C.flamingo },
          }
        end,
      }, opts)
    end,
    name = "catppuccin",
  },
}
