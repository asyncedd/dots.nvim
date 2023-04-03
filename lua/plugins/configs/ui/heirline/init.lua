return function()
  local heirline = require("heirline")
  local conditions = require("heirline.conditions")
  local colors = require("plugins.configs.ui.heirline.colors")
  local ViMode = require("plugins.configs.ui.heirline.vimode")
  local FileName = require("plugins.configs.ui.heirline.filename")
  local Gitsigns = require("plugins.configs.ui.heirline.git")
  local Scrollbar = require("plugins.configs.ui.heirline.scrollbar")
  local File = require("plugins.configs.ui.heirline.file")
  local LSP = require("plugins.configs.ui.heirline.lsp")
  local Bufferline = require("plugins.configs.ui.heirline.bufferline")

  heirline.load_colors(colors)

  local Align = { provider = "%=" }
  local Space = { provider = " " }

  local DefaultStatusLine = {
    ViMode, Space, FileName.WorkDir, Space, FileName.FileNameBlock, Space, Gitsigns, Space,
    LSP.LSPActive, LSP.Diagnostics, Align,
    File.FileType, Space, Scrollbar.Ruler, Space, Scrollbar.ScrollBar,
  }

  local bufferline = {
    require("plugins.configs.ui.heirline.tablineoffset"),
    Bufferline,
    require("plugins.configs.ui.heirline.tablist").Tabpages,
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
        V ="cyan",
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

    -- the first statusline with no condition, or which condition returns true is used.
    -- think of it as a switch case with breaks to stop fallthrough.
    fallthrough = false,

    DefaultStatusLine,
  }

  heirline.setup({
    statusline = StatusLines,
    tabline = bufferline
  })
end
