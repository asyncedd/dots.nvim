local g = vim.g

-- Enable surround mappings. (enhanced % operators)
g.matchup_surround_enabled = 1

-- Enable the experimental transmute module.
-- This will chnage matchiing text in parallel.
g.matchup_transmute_enabled = 1

-- Disable off-screen matching displays.
g.matchup_matchparen_offscreen = {}

-- Defer highlighting to improve cursor movement performance.
g.matchup_matchparen_deferred = 1

-- Always show surround delimiters always as the cursor moves.
g.matchup_matchparen_hi_surround_always = 1

return {
  matchup = {
    enable = true,
  },
}
