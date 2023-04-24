local o = vim.opt

local icons = require("core.utils.icons")

for name, icon in pairs(icons) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
  diagnostics = {
    underline = true,
    update_in_insert = true,
    virtual_text = { spacing = 4 },
    severity_sort = true,
    float = {
      border = "single",
      title = "Diagnostics",
      header = {},
      suffix = {},
      format = function(diag)
        if diag.code then
          return ("[%s](%s): %s"):format(diag.source, diag.code, diag.message)
        else
          return ("[%s]: %s"):format(diag.source, diag.message)
        end
      end,
    },
  },
  virtual_text = {
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return icons.Error -- Nerd font icon for error
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return icons.Warn -- Nerd font icon for warning
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return icons.Info -- Nerd font icon for info
      else
        return icons.Hint -- Nerd font icon for hint
      end
    end,
  },
  hover = {
    border = "single",
    title = "Hover",
  },
  signature_help = {
    border = "single",
  },
})

-- I'm not kidding, you shouldn't have keymaps if, you can't key them after like 100ms.
require("settings.keymap")

-- Enable clipboard :)
o.clipboard = "unnamedplus,unnamed"
-- Enable cool undos :)
o.undofile = true
-- Enable undo levels
o.undolevels = 10000
-- Enable more undo stuff
o.undoreload = 10000

local colors

if vim.g.colorscheme == "catppuccin" then
  colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
  require("catppuccin.lib.highlighter").syntax({
    Pmenu = { bg = colors.crust, fg = "" },
  })
elseif vim.g.colorscheme == "tokyonight" then
  colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_dark })
end

require("nvim-treesitter.configs").setup({
  -- Treesitter powered indents.
  indent = {
    enable = true,
  },
})
