local M

local lazy_require = require("snips.lazy-require").require_on_index
local heirline = lazy_require("heirline")
local conditions = lazy_require("heirline.conditions")
local utils = lazy_require("heirline.utils")
local ViMode = require("plugins.configs.ui.heirline.statusline.vimode")
-- Unfortunately lazy_requiring ViMode doesn't work ;-;
local FileName = lazy_require("plugins.configs.ui.heirline.statusline.filename")
local Gitsigns = require("plugins.configs.ui.heirline.statusline.git")
local Scrollbar = lazy_require("plugins.configs.ui.heirline.statusline.scrollbar")
local File = lazy_require("plugins.configs.ui.heirline.statusline.file")
local LSP = lazy_require("plugins.configs.ui.heirline.statusline.lsp")
local Lazy = lazy_require("plugins.configs.ui.heirline.statusline.lazy")
local SearchResults = require("plugins.configs.ui.heirline.statusline.search")

local Align = { provider = "%=", hl = { bg = "normal" } }
local Space = { provider = " ", hl = { bg = "normal" } }
local surround = function(color, obj)
  return utils.surround({ "", "" }, color, { obj })
end

local DefaultStatusLine = {
  Lazy,
  Space,
  ViMode,
  Space,
  SearchResults,
  surround("bright_bg", {
    FileName.WorkDir,
    surround(function(self)
      return self:mode_color()
    end, FileName.FileNameBlock),
  }),
  -- utils.surround({ "", "" }, "bright_bg", {
  --   FileName.WorkDir,
  --   utils.surround({ "", "" }, function(self) return self:mode_color() end, { FileName.FileNameBlock }),
  -- }),
  Align,
  {
    Gitsigns,
    hl = { bg = "normal" },
  },
  Space,
  {
    LSP.LSPActive,
    hl = { bg = "normal" },
  },
  Space,
  {
    LSP.Diagnostics,
    hl = { bg = "normal" },
  },
  Align,
  { { File.FileType, Space, Scrollbar.Ruler, Space, Scrollbar.ScrollBar }, hl = { bg = "normal" } },
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

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  DefaultStatusLine,
}

M = StatusLines

return M
