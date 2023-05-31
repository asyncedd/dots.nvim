local icon = require("core.utils.icons")
local colors = require("catppuccin.palettes").get_palette()

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
    custom_areas = {
      left = function()
        return {
          { text = " ", fg = colors.green },
        }
      end,
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Docs",
          highlight = { sp = colors.green },
          matcher = function(buf)
            return buf.name:match("%.md") or buf.name:match("%.txt")
          end,
        },
      },
    },
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get({
    styles = { "italic", "bold" },
  }),
}
