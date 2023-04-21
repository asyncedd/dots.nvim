local mocha = require("catppuccin.palettes").get_palette("mocha")
local hl = vim.api.nvim_set_hl

local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
   TelescopeSelection = { bg = colors.surface0 },
  TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
  TelescopePromptPrefix = { bg = colors.surface0 },
  TelescopePromptNormal = { bg = colors.surface0 },
  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopePreviewNormal = { bg = colors.crust },
  TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
  TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
  TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
  TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
})

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
