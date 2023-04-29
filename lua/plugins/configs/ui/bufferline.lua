local ico = require("core.utils.icons")

local icons = {
  ["warn"] = ico.Warn,
  ["info"] = ico.Info,
  ["hint"] = ico.Hint,
  ["error"] = ico.Error,
}

return {
  options = {
    mode = "buffers",
    themable = true,
    numbers = "buffer_id",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      return (icons[level] or "?") .. " " .. count
    end,
    sort_by = "insert_after_current",
    right_mouse_command = "vert sbuffer %d",
    always_show_bufferline = false,
  },
}
