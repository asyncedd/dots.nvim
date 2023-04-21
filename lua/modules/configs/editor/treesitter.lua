return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "help" },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  })
end
