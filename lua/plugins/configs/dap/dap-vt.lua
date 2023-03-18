return function()
  require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = true,
    show_stop_reason = true,
    commented = true,
    only_first_definition = true,
    all_references = true,

    virt_text_pos = "eol",
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil,
  })
end
