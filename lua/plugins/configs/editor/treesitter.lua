local colorscheme = vim.g.colorscheme

if colorscheme == "catppuccin" then
  local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

  require("catppuccin.lib.highlighter").syntax({
    -- { "@variable", { fg = colors.red } },
    ["@variable"] = { fg = colors.red, style = { "italic" } },
    -- ["@field"] = { fg = colors.lavender },
    -- ["@property"] = { fg = colors.yellow },
    ["@variable.builtin"] = { fg = colors.maroon, style = { "italic" } },
    ["@punctuation.bracket"] = { fg = colors.maroon },
    -- ["@enum"] = { link = "@type" },
    -- ["@text"] = { fg = colors.text },
  })
elseif colorscheme == "tokyonight" then
  local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above

  vim.api.nvim_set_hl(0, "@variable", { fg = colors.red, italic = true })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.purple, italic = true })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.purple })
end

require("nvim-treesitter.configs").setup({
  -- Ensure both markdown and markdown_inline is installed.
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "luap",
    "lua",
  },

  -- Automagically install parsers when needed.
  auto_install = true,

  -- Enable treesitter's highlighting.
  highlight = {
    enable = true,
    -- use_language_tree = true,
  },
})
