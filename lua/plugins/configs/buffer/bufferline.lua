local icon = require("core.utils.icons")

local icons = {
  ["warn"] = icon.Warn,
  ["hint"] = icon.Hint,
  ["info"] = icon.Hint,
  ["error"] = icon.Error,
}

return {
  options = {
    close_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    right_mouse_command = function(n)
      require("mini.bufremove").delete(n, false)
    end,
    mode = "buffer",
    numbers = "buffer_id",
    sort_by = "insert_after_current",
    hover = {
      enabled = true,
      delay = 100,
      reveal = {
        "close",
      },
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      level = level:match("warn") and "warn" or level
      return (icons[level] or "?") .. " " .. count
    end,
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
    },
  },
}
