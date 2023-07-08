return {
  style = "moon",
  on_highlights = function(hl, c)
    hl["@variable"] = {
      fg = c.teal,
    }
    -- Telescope
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePreviewBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }

    hl.CmpItemKindCodeium = { fg = c.green }
    hl.CmpItemKindTabNine = { fg = c.purple }
    hl.CmpItemKindSnippet = { fg = c.red }

    hl.FloatBorder = { fg = c.bg_dark, bg = c.bg_dark }
  end,
}
