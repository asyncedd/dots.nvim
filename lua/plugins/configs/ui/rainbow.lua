require("nvim-treesitter.configs").setup({
  rainbow = {
    enable = true,
    query = "rainbow-parens",
    strategy = require("ts-rainbow").strategy.global,
  },
})
