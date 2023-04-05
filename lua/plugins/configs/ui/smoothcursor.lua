require("smoothcursor").setup({
  autostart = true,
  cursor = "", -- cursor shape (need nerd font)
  texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
  linehl = "CursorLine", -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
  type = "default", -- define cursor movement calculate function, "default" or "exp" (exponential).
  fancy = {
    enable = true, -- enable fancy mode
    head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
    tail = { cursor = nil, texthl = "SmoothCursor" },
  },
  flyin_effect = nil, -- "bottom" or "top"
  speed = 25, -- max is 100 to stick to your current position
  intervals = 35, -- tick interval
  priority = 10, -- set marker priority
  timeout = 3000, -- timout for animation
  threshold = 3, -- animate if threshold lines jump
  disable_float_win = true, -- disable on float window
  enabled_filetypes = nil, -- example: { "lua", "vim" }
  disabled_filetypes = nil, -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
})
