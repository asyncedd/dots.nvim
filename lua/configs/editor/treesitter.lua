local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

local markid = require("markid")

markid.colors = {
  bright = {"#f5c2e7", "#fab387", "#f9e2af", "#f5c0e8", "#94e2d5", "#89dceb", "#74c7ec", "#b4befe", "#cba6f7", "#c5e1a5" },
}

treesitter.setup({
  auto_install = true, -- Auto-install missing parsers. (once you open a file that requires it.)
  highlight = {
    enable = true -- Enable beautiful syntax highlighting!!!
  },
  indent = {
    enable = true
  },
  markid = {
    enable = true,
    colors = markid.colors.bright
  }
})
