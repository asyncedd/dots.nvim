require("nvim-tree").setup({
  auto_reload_on_write = true,
  hijack_cursor = true,
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  git = {
    enable = true,
  },
  modified = {
    enable = true,
  },
  view = {
    centralize_selection = true,
    cursorline = true,
    width = 30,
    hide_root_folder = false,
    side = "left",
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    full_name = true,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
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
    },
  },
  experimental = {
    git = {
      async = true,
    },
  },
})
