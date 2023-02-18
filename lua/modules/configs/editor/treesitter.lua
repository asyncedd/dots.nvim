return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "help", "query" },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
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
    rainbow = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
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
