return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "help" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end
