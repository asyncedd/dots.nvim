local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local Space = { provider = " " }
local file = require("ui.heirline.filename")

local WinBars = {
  fallthrough = false,
  {   -- Hide the winbar for special buffers
    condition = function()
      return conditions.buffer_matches({
        buftype = { "nofile", "prompt", "help", "quickfix" },
        filetype = { "^git.*", "fugitive" },
      })
    end,
    init = function()
      vim.opt_local.winbar = nil
    end
  },
  {   -- A special winbar for terminals
    condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    utils.surround({ "", "" }, "dark_red", {
      file.FileType,
      Space,
      -- TerminalName,
    }),
  },
  {   -- An inactive winbar for regular files
    condition = function()
      return not conditions.is_active()
    end,
    utils.surround({ "", "" }, "bright_bg", { hl = { fg = "gray", force = true }, file.FileNameBlock }),
  },
  -- A winbar for regular files
  utils.surround({ "", "" }, "bright_bg", file.FileNameBlock),
}

return WinBars
