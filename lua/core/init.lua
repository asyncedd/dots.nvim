local o = vim.api.nvim_set_option_value

o("shadafile", "NONE", {})

vim.g.mapleader = " "

require("core.lazy")

vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()

  require("core.options")

  require("core.autocmd")
  require("mappings.movement")
  require("mappings.lspsaga")

  o("shadafile", "", {})
end, 0)
