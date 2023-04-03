local colors = {
  rosewater = "#F5E0DC",
  flamingo = "#F2CDCD",
  pink = "#F5C2E7",
  mauve = "#CBA6F7",
  red = "#F38BA8",
  maroon = "#EBA0AC",
  peach = "#FAB387",
  yellow = "#F9E2AF",
  green = "#A6E3A1",
  teal = "#94E2D5",
  sky = "#89DCEB",
  sapphire = "#74C7EC",
  blue = "#89B4FA",
  lavender = "#B4BEFE",

  text = "#CDD6F4",
  subtext1 = "#BAC2DE",
  subtext0 = "#A6ADC8",
  overlay2 = "#9399B2",
  overlay1 = "#7F849C",
  overlay0 = "#6C7086",
  surface2 = "#585B70",
  surface1 = "#45475A",
  surface0 = "#313244",

  base = "#1E1E2E",
  mantle = "#181825",
  crust = "#11111B",
}


local catppuccin_theme = {
  normal = {
    a = { fg = colors.mantle, bg = colors.pink },
    b = { fg = colors.text, bg = colors.mantle },
    c = { fg = colors.text, bg = colors.base }
  },
  insert = { a = { fg = colors.mantle, bg = colors.sky } },
  visual = { a = { fg = colors.mantle, bg = colors.lavender } },
  replace = { a = { fg = colors.mantle, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

return function()
  require("lualine").setup({
    options = {
      theme = catppuccin_theme,
      component_seperators = "|",
      section_separators = { left = '', right = '' },
    },
    sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  })
end
