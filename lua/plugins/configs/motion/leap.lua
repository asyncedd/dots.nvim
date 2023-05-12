-- Add leap.nvim's default mappings.
--
-- Which is:
-- `s`/`S` to leap foward and backwards respectively. (for normal mode)
-- `x`/`X` to leap foward and backwards until x respectively. (for visual and operator mode)
require("leap").add_default_mappings()

require("leap").opts.highlight_unlabeled_phase_one_targets = true
