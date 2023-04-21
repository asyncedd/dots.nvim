return function ()
  require("nvim-tree").setup({
    renderer = {
      add_trailing = true,
      highlight_git = true,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      }
    },
    diagnostics = {
      enable = true
    }
  })
end
