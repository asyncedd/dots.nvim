return function()
  require("tokyonight").setup({
    style = "night",
    terminal_colors = true,
    styles = {
      comments = { italic = true, },
      keywords = { italic = true, },
      functions = { italic = true, },
      variables = { italic = true, },
    },
  })
end
