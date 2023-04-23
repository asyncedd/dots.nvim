require("nvim-treesitter.configs").setup({
  -- Have Vim-matchup!
  matchup = {
    enable = true,
  },
})

local g = vim.g

g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = { method = "none" }
g.matchup_matchparen_hi_surround_always = 1
