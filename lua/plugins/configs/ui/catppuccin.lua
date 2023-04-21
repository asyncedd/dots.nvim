require("catppuccin").setup({
  custom_highlights = function(ctp)
    return {
      Pmenu = { bg = ctp.crust, fg = "" },

      ["@lsp.type.parameter"] = { fg = ctp.red },
      -- ["@lsp.type.variable"] = { fg = ctp.pink },
      ["@lsp.type.function"] = { fg = ctp.blue },

      ["@variable"] = { fg = ctp.pink },

      -- Stolen some highlightings that only need from the colorscheme it self.
      MiniIndentscopeSymbol = { fg = ctp.blue },
      MiniIndentscopePrefix = { style = { "nocombine" } }, -- Make it invisible
    }
  end,
  integrations = {
    illuminate = true,
  },
})
