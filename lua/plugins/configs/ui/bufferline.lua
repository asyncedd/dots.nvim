local icon = require("core.utils.icons")

local icons = {
  ["warn"] = icon.Warn,
  ["hint"] = icon.Hint,
  ["info"] = icon.Hint,
  ["error"] = icon.Error,
}

return {
  options = {
    mode = "buffer",
    numbers = "buffer_id",
    sort_by = "insert_after_current",
    right_mouse_command = "vert sbuffer %d",
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
  },
}
