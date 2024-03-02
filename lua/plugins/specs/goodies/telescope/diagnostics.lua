return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      },
    },
  },
}
