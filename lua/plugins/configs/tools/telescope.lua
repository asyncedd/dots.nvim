local mocha = require("catppuccin.palettes").get_palette("mocha")
local hl = vim.api.nvim_set_hl

hl(0, "TelescopeSelection", { bg = mocha.surface0 })
hl(0, "TelescopePromptCounter", { fg = mocha.mauve, bold = true })
hl(0, "TelescopePromptPrefix", { fg = mocha.text })
hl(0, "TelescopePromptNormal", { fg = mocha.text })
hl(0, "TelescopeResultsNormal", { fg = mocha.text })
hl(0, "TelescopePreviewNormal", { fg = mocha.crust })
hl(0, "TelescopePromptBorder", { bg = mocha.surface0, fg = mocha.surface0 })
hl(0, "TelescopeResultsBorder", { bg = mocha.mantle, fg = mocha.mantle })
hl(0, "TelescopePreviewBorder", { bg = mocha.crust, fg = mocha.crust })
hl(0, "TelescopePromptTitle", { fg = mocha.surface0, bg = mocha.surface0 })
hl(0, "TelescopeResultsTitle", { fg = mocha.mantle, bg = mocha.mantle })
hl(0, "TelescopePreviewTitle", { fg = mocha.crust, bg = mocha.crust })

require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

require("telescope").load_extension("frecency")

require("telescope").load_extension("persisted")
