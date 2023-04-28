local bufferline = require("bufferline")
local icons = require("core.utils.icons")

icons = {
  ["error"] = icons.Error,
  ["warn"] = icons.Warn,
  ["hint"] = icons.Hint,
  ["info"] = icons.Info,
}

bufferline.setup({
  options = {
    separator_style = "thick",
    diagnostics = "nvim_lsp",
    -- style_preset = { bufferline.style_preset.minimal },
    diagnostics_indicator = function(count, level)
      level = level:match("warn") and "warn" or level
      return (icons[level] or "?") .. " " .. count
    end,
    hover = { enabled = true, reveal = { "close" } },
    sort_by = "insert_after_current",
    numbers = function(opts)
      return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
    end,
  },
})
