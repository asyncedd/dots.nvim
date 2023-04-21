local leap = require("leap")

leap.add_default_mappings()

local hl = vim.api.nvim_set_hl

-- The below settings make Leap's highlighting closer to what you've been
-- used to in Lightspeed.

hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
hl(0, "LeapMatch", {
  -- For light themes, set to 'black' or similar.
  fg = "white", bold = true, nocombine = true,
})
-- Of course, specify some nicer shades instead of the default "red" and "blue".
hl(0, "LeapLabelPrimary", {
  fg = "pink", bold = true, nocombine = true,
})
hl(0, "LeapLabelSecondary", {
  fg = "blue", bold = true, nocombine = true,
})

-- Try it without this setting first, you might find you don't even miss it.
leap.opts.highlight_unlabeled_phase_one_targets = true

