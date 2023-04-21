-- lua/user/options
-- Options for Neovim.

local o = vim.opt
local g = vim.g

--  +----------------------------------------------------------+
--  |                    1. IMPORTANT STUF                     |
--  +----------------------------------------------------------+
--
-- 1.1 Set the mapleader key to <Space>
g.mapleader = " "

-- 1.2 Fix markdown indentations.
g.markdown_recommended_style = 0

--  +----------------------------------------------------------+
--  |                     2. Editor stuff.                     |
--  +----------------------------------------------------------+
--
-- 2.1 Indentations.
-- As, 0.2x Devs, we need our 2 space indentation
o.sw = 2 -- sw = shiftwidth

-- -- Automagically indents based on the previous line.
-- o.ai = true -- ai = artifical intelligent indents and totally not autoindent
-- -- Smartly indents based on the current syntax and filetype.
-- o.si = true -- si = smartindent
-- Expand tabs.
o.et = true -- et = expand tab

--  +----------------------------------------------------------+
--  |                       3. UI stuff                        |
--  +----------------------------------------------------------+
--
-- 3.1 Enable line numbers.
-- Set lines numbers.
o.nu = true -- nu = line numbers

-- Also relative nuumbers
o.rnu = true -- rnu = relative line numbers

-- Also cursor lines.
o.cul = true

-- 3.2 Enable TermGUIColors.
-- Have those glorious 24 bit colors! Take that Windows XP!
o.tgc = true -- tgc = term gui colors.

-- 3.3 Some stuff I totally didn't steal from mini.basics
o.pb = 10 -- Make builtin completion menus slightly transparent
-- pb = pumblend.
o.ph = 10 -- Make popup menu smaller
-- ph = pumheight.
o.winbl = 10 -- Make floating windows slightly transparent
-- winbl = winblend

o.shm:append('WcC') -- Reduce command line messages
-- shm = shortmess
o.spk = 'screen' -- spk = splitkeep

--  +----------------------------------------------------------+
--  |                        4. Windows                        |
--  +----------------------------------------------------------+
--
-- 4.1 Splits
-- Splits on the right
o.spr = true -- spr = split right

--  +----------------------------------------------------------+
--  |                       5. Searching                       |
--  +----------------------------------------------------------+
--
--  5.1 Searching.
--  Ignore cases whilst searching.
o.ic = true -- ic = ignore case.
-- If there is a capital letter, don't ignore case.
o.sc= true -- sc = smart case.
-- Highlight whilst you search.
o.is = true -- is = incsearch.

--  +----------------------------------------------------------+
--  |                        6. Neovide                        |
--  +----------------------------------------------------------+

-- Check if we're using Neovide or not.
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- 6.1 Cursor related settigns.
  -- Set the cursor particles to be "railgun".
  g.neovide_cursor_vfx_mode = "railgun"

  -- 6.2 Neovide windows settings.
  -- Make floating windows a little bit blurry.
  g.neovide_floating_blur_amount_x = 1.0

  g.neovide_floating_blur_amount_y = 1.0

  -- 6.3 Neovide zoom settings.
  -- Make Neovide not too zoomed in.
  g.neovide_scale_factor = 0.5

end
