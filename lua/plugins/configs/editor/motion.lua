return function()
  local leap = require("leap")
  local flit = require("flit")
  local miniAi = require("mini.ai")

  miniAi.setup()

  leap.add_default_mappings(true)
  vim.keymap.del({ "x", "o" }, "x")
  vim.keymap.del({ "x", "o" }, "X")
  -- The below settings make Leap's highlighting closer to what you've been
  -- used to in Lightspeed.

  vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
  vim.api.nvim_set_hl(0, "LeapMatch", {
    -- For light themes, set to 'black' or similar.
    fg = "white",
    bold = true,
    nocombine = true,
  })
  -- Of course, specify some nicer shades instead of the default "red" and "blue".
  vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
    fg = "pink",
    bold = true,
    nocombine = true,
  })
  vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
    fg = "blue",
    bold = true,
    nocombine = true,
  })
  -- Try it without this setting first, you might find you don't even miss it.
  -- require('leap').opts.highlight_unlabeled_phase_one_targets = true

  flit.setup()

end
