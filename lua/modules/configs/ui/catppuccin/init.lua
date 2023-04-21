return function()
  require("catppuccin").setup({
    flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
    background = { light = "latte", dark = "mocha" },
    dim_inactive = {
      enabled = true,
      -- Dim inactive splits/windows/buffers.
      -- NOT recommended if you use old palette (a.k.a., mocha).
      shade = "dark",
      percentage = 0.15,
    },
    highlight_overrides = {
      mocha = require("ui.catppuccin.highlight_overrides")
    },
    integrations = require("ui.catppuccin.integrations")
  })
end
