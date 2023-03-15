return function()
  require("nvim-tree").setup({
    renderer = {
      full_name = true,
      group_empty = true,
      symlink_destination = false,
      indent_markers = {
        enable = true,
      },
      highlight_git = true,
    },
    diagnostics = {
      enable = true,
    }
  })
end
