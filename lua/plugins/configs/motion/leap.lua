local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  LeapBackdrop = { link = "Comment" },
  LeapMatch = { fg = colors.text, style = { "bold", "nocombine" } },
  LeapLabelPrimary = { fg = colors.pink, style = { "bold", "nocombine" } },
  LeapLabelSecondary = { fg = colors.sky, style = { "bold", "nocombine" } },
})

require("leap").add_default_mappings()

require("leap").opts.highlight_unlabeled_phase_one_targets = true

