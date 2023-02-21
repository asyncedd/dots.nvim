return function()
  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
  local colors = require("ui.heirline.colors")
  local ViMode = require("ui.heirline.vimode")
  local filename = require("ui.heirline.filename").FileNameBlock
  local filetype = require("ui.heirline.filetype")
  -- local fileEncoding = require("ui.heirline.file_encoding")
  -- local fileSize = require("ui.heirline.filesize")
  local ruler = require("ui.heirline.ruler")
  local scrollbar = require("ui.heirline.scrollbar")
  local lspactive = require("ui.heirline.lsp")
  local diagnostics = require("ui.heirline.diagnostics")
  local git = require("ui.heirline.git")
  local TablineOffset = require("ui.heirline.tablineoffset")
  local Bufferline = require("ui.heirline.bufferline")
  local Tabpage = require("ui.heirline.tablist")
  local winbar = require("ui.heirline.winbar")
  local search_results = require("ui.heirline.search_results")
  local TerminalName = require("ui.heirline.terminalname")
  -- local navic = require("ui.heirline.navic")
  require("heirline").load_colors(colors())
  local Space = { provider = " " }
  local Align = { provider = "%=" }
  ViMode = utils.surround({ "", "" }, function(self) return self:mode_color() end, { ViMode })

  local DefaultStatusLine = {
    utils.surround({ "", "" }, "bright_bg", {
      ViMode, Space,
      search_results, Space,
      filename, Space,
      git, Space,
      diagnostics,
    }), Space, Space, Space,
    utils.surround({ "", "" }, "bright_bg", { lspactive }), Space,
    Align, Space, ruler, Space, scrollbar, Space,
    Space, filetype, Space
  }

  local InactiveStatusline = {
    condition = conditions.is_not_active,
    filetype, Space, filename, Align,
  }

  local TerminalStatusline = {

    condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,

    hl = { bg = "dark_red" },

    -- Quickly add a condition to the ViMode to only show it when buffer is active!
    { condition = conditions.is_active, ViMode, Space }, FileType, Space, TerminalName, Align,
  }

  local Tabline = {
    TablineOffset,
    Bufferline,
    Tabpage,
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

    DefaultStatusLine,
    InactiveStatusline,
    TerminalStatusline,
  }
  require("heirline").setup({
    statusline = StatusLines,
    tabline = Tabline,
    winbar = winbar
  })
end
