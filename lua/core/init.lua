local o = vim.api.nvim_set_option_value

vim.g.mapleader = " "
o("shadafile", "NONE", {})

require("core.options")

require("core.lazy")

require("plugins.loader")

vim.api.nvim_command("colorscheme catppuccin")

vim.defer_fn(function()
  require("core.autocmd")
  require("mappings.movement")
  require("mappings.lspsaga")
  require("mappings.plugins")

  o("shadafile", "", {})
end, 0)
