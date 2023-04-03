return function()
  require("nvim-treesitter.configs").setup({
    auto_install = { enable = true },
    highlight = {
      enable = true,
    },
  })
end
