require("nvim-tree").setup({
  renderer = {
    full_name = true,
    group_empty = true,
    symlink_destination = false,
    indent_markers = {
      enable = true,
    },
  },
  icons = {
    git_placement = "signcolumn",
    show = {
      file = true,
      folder = true,
      folder_arrow = true,
      git = true
    }
  }
})
