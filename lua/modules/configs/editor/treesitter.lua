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
    -- rainbow = {
    --   enable = true,
    -- },
  --   refactor = {
  --     highlight_definitions = {
  --       enable = true,
  --       -- Set to false if you have an `updatetime` of ~100.
  --       clear_on_cursor_move = true,
  --     },
  --     highlight_current_scope = { enable = true },
  --     smart_rename = {
  --       enable = true,
  --       keymaps = {
  --         smart_rename = "grr",
  --       },
  --     },
  --     navigation = {
  --       enable = true,
  --       keymaps = {
  --         goto_definition = "gnd",
  --         list_definitions = "gnD",
  --         list_definitions_toc = "gO",
  --         goto_next_usage = "<a-*>",
  --         goto_previous_usage = "<a-#>",
  --       },
  --     },
  --   },
   })
end
