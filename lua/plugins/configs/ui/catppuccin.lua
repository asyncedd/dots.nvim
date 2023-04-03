return function()
  require("catppuccin").setup({
    dim_inactive = {
      enabled = true,
    },
    term_colors = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      neotree = false,
      telescope = true,
      notif = false,
      mini = true,
      leap = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underlines" },
          information = { "underline" },
        },
      },
    },
    styles = {
      comments = { "italic" },
      properties = { "italic" },
      functions = { "bold" },
      keywords = { "italic" },
      operators = { "bold" },
      conditionals = { "bold" },
      loops = { "bold" },
      booleans = { "bold", "italic" },
      numbers = {},
      types = {},
      strings = {},
      variables = {},
    },
    color_overrides = {
      mocha = {
        rosewater = "#F5E0DC",
        flamingo = "#F2CDCD",
        mauve = "#DDB6F2",
        pink = "#F5C2E7",
        red = "#F28FAD",
        maroon = "#E8A2AF",
        peach = "#F8BD96",
        yellow = "#FAE3B0",
        green = "#ABE9B3",
        blue = "#96CDFB",
        sky = "#89DCEB",
        teal = "#B5E8E0",
        lavender = "#C9CBFF",

        text = "#D9E0EE",
        subtext1 = "#BAC2DE",
        subtext0 = "#A6ADC8",
        overlay2 = "#C3BAC6",
        overlay1 = "#988BA2",
        overlay0 = "#6E6C7E",
        surface2 = "#6E6C7E",
        surface1 = "#575268",
        surface0 = "#302D41",
        base = "#1E1E2E",
        mantle = "#1A1826",
        crust = "#161320",
      },
    },
    highlight_overrides = {
      mocha = function(cp)
        return {
          -- For base configs.
          NormalFloat = { fg = cp.text, bg = cp.base },
          CursorLineNr = { fg = cp.green },
          Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
          IncSearch = { bg = cp.pink, fg = cp.surface1 },
          Keyword = { fg = cp.pink },
          Type = { fg = cp.blue },
          Typedef = { fg = cp.yellow },
          StorageClass = { fg = cp.red, style = { "italic" } },
          LocalVariable = { fg = cp.pink, style = { "italic" } },
        }
      end,
    },
  })
end
