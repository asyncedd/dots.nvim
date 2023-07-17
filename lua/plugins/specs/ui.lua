return {
  {
    "catppuccin/nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", {
        custom_highlights = function(C)
          return {
            ["@variable"] = { fg = C.flamingo },
            Pmenu = { bg = C.mantle },
          }
        end,
      }, opts)
    end,
    name = "catppuccin",
  },
}
