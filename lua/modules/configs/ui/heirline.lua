return function()
  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
  local colors = require("ui.heirline.colors")
  local ViMode = require("ui.heirline.vimode")
  local filename = require("ui.heirline.filename")
  local filetype = require("ui.heirline.filetype")
  -- local fileEncoding = require("ui.heirline.file_encoding")
  -- local fileSize = require("ui.heirline.filesize")
  local ruler = require("ui.heirline.ruler")
  local scrollbar = require("ui.heirline.scrollbar")
  local lspactive = require("ui.heirline.lsp")
  local diagnostics = require("ui.heirline.diagnostics")
  local git = require("ui.heirline.git")
  -- local navic = require("ui.heirline.navic")
  require("heirline").load_colors(colors())
  local Space = { provider = " " }
  local Align = { provider = "%=" }

  local DefaultStatusLine = {
    utils.surround({ "", "" }, "bright_bg", {ViMode, Space,
      filename, Space,
      git, Space,
      diagnostics, Space,
      lspactive
    }), Align,
    Align,
    Align, Space, utils.surround({ "", "" }, function(self) return self:mode_color() end, {ruler, hl = {fg = 'black'}} ), Space, 
    scrollbar, Space, filetype, Space
  }

  local StatusLines = {

    hl = function()
      if conditions.is_active() then
        return "StatusLine"
      else
        return "StatusLineNC"
      end
    end,
    static = {
      mode_colors_map = {
        n = "red",
        i = "green",
        v = "cyan",
        V = "cyan",
        ["\22"] = "cyan",
        c = "orange",
        s = "purple",
        S = "purple",
        ["\19"] = "purple",
        R = "orange",
        r = "orange",
        ["!"] = "red",
        t = "green",
      },
      mode_color = function(self)
        local mode = conditions.is_active() and vim.fn.mode() or "n"
        return self.mode_colors_map[mode]
      end,
    },

  fallthrough = false,

  DefaultStatusLine
}
  require("heirline").setup({ statusline = StatusLines })
end
