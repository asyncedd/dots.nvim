return function()
  require("lualine").setup({
    options = {
      theme = "auto",
      component_seperators = "|",
      section_separators = { left = '', right = '' },
    }
  })
end
