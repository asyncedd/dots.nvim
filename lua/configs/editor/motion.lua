local status, leap = pcall(require, "leap")
if (not status) then return end

leap.add_default_mappings()

require("flit").setup({
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
})

require("mini.ai").setup()

require("leap-spooky").setup()

-- The below settings make Leap's highlighting closer to what you've been
-- used to in Lightspeed.

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', {
  -- For light themes, set to 'black' or similar.
  fg = 'white', bold = true, nocombine = true,
})
-- Of course, specify some nicer shades instead of the default "red" and "blue".
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
  fg = 'pink', bold = true, nocombine = true,
})
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
  fg = 'blue', bold = true, nocombine = true,
})
-- Try it without this setting first, you might find you don't even miss it.
-- require('leap').opts.highlight_unlabeled_phase_one_targets = true
