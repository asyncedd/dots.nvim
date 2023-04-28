return {
  map = "n", -- Use nvim-autopairs for the main insertation mappings.
  cmap = "u", -- Use ultimate-autopairs.nvim for cmdline mappings.
  bs = "u", -- Apperntly, according to ultimate-autopairs.nvim's README, it has better <Backspace> mappings, so I'll go for it, I guess. (Even though, I've haven't seen any improvements.)
  cr = "u", -- Use ultimate-autopairs.nvim for <CR> mappings.
  space = "u", -- OK, ultimate-autopairs.nvim is the only one, of the two to support this, so I'll have to use this!
  c_h = "n", -- Only nvim-autopairs is supported. <C-h> basically deletes pairs.
  c_w = "n", -- Same as above. But, <C-w> TRIES to delete pairs IF POSSIBLE.
  --
  fastwarp = "<A-e>", -- ultimate-autopairs.nvim's fast wrap mapping.
  rfastwarp = '<A-E>', -- ultimate-autopairs.nvim's reverse fast wrap mapping.
  fastwrap = "<A-;>", -- nvim-autopairs's fastwrap mapping.
  npairs_conf = {
    check_ts = true, -- Use treesitter to check for a pair.
    map_c_h = true, -- Map <C-h> mappings.
    map_c_w = true, -- Map <C-w> mappings.
    map_bs = false, -- Don't map <Backspace> mappings, as we'll use ultimate-autopairs.nvim's mappings.
  },
  upair_conf = {
    bs = {
      enable = true, -- Enable <BS> mappings.
      overjump = true, -- And, OVERJUMP!
      space = true, -- Delete spaces too!
      multichar = true, -- Mutlichar deletes.
    },
    cr = {
      enable = true, -- Enable <CR> mappings.
      autoclose = true, -- Autoclose pairs if they don't exist?
    },
    space = { enable = true }, -- Add spaces in pairs as pairs then, delete them as pairs, WTF?
    fastwarp = {
      enable = true, -- Enable fastwarp. You can <A-e> to warp warp and warp! (it's a little sus though.)
    },
  },
}

