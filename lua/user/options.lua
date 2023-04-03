-- Set some options for Neovim.
-- If you want a low-overhead version of this, directly set it in `core.options`.
-- I meant, you should really do it.

local opts = {

  -- Set options by: (ex)
  -- numbers = true,
  -- To enable line numbers
  -- https://neovim.io/doc/user/options.html
  -- Btw, K1SS. (Keep it simple, stupid)
  --
  -- Some tips for troubleshooting.
  -- - Does all lines ends with ","?
  -- For ex.
  -- a = a,
  -- b = b,
  -- c = c,
  -- d = d <-- This!
  -- e = e,
  -- listchars = { -- See Spaces and eol's as a character.
  --   eol = "↴",
  --   space = "⋅",
  --   tab = "▶ ",
  --   -- trail = "•",
  --   precedes = "«",
  --   extends = "»",
  --   nbsp = "␣",
  -- }
}

-- EOL
-- DO NOT "HACK" this line!
return opts
