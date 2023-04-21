return function()
  require("lualine").setup({
    options = {
      theme = "catppuccin",
      component_seperators = "|",
      section_separators = { left = '', right = '' },
    }
  })
end
