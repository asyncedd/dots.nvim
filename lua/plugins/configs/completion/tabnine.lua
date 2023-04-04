require("tabnine").setup({
  disable_auto_comment = true,
  accept_keymap = "<C-l>",
  dismiss_keymap = "<C-e>",
  debounce_ms = 100,
  suggestion_color = { gui = "#808080", cterm = 244 },
  execlude_filetypes = { "TelescopePrompt" },
})
