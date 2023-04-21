return function()
  local conditions = require("heirline.conditions")

  local colors = require("ui.heirline.colors")
  local ViMode = require("ui.heirline.vimode")
  local filename = require("ui.heirline.filename")
  local filetype = require("ui.heirline.filetype")
  -- local fileEncoding = require("ui.heirline.file_encoding")
  local fileSize = require("ui.heirline.filesize")
  require("heirline").load_colors(colors())
  local Space = { provider = " " }
  local Align = { provider = "%=" }

  local DefaultStatusLine = {
    ViMode, Space, filename, Align,
    Align,
    filetype, Space, fileSize
  }

  local StatusLines = {

    hl = function()
      if conditions.is_active() then
        return "StatusLine"
      else
        return "StatusLineNC"
      end
    end,

    fallthrough = false,

    DefaultStatusLine
  }
  require("heirline").setup({ statusline = StatusLines })
end
