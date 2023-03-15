local heirline = require("heirline")
local utils = require("heirline.utils")
local get_highlight = utils.get_highlight

local colors = {
  normal = get_highlight("Normal").bg,
  bright_bg = get_highlight("Folded").bg,
  bright_fg = get_highlight("Folded").fg,
  red = get_highlight("DiagnosticError").fg,
  dark_red = get_highlight("DiffDelete").bg,
  green = get_highlight("String").fg,
  blue = get_highlight("Function").fg,
  gray = get_highlight("NonText").fg,
  orange = get_highlight("Constant").fg,
  purple = get_highlight("Statement").fg,
  cyan = get_highlight("Special").fg,
  diag_warn = get_highlight("DiagnosticWarn").fg,
  diag_error = get_highlight("DiagnosticError").fg,
  diag_hint = get_highlight("DiagnosticHint").fg,
  diag_info = get_highlight("DiagnosticInfo").fg,
  git_del = get_highlight("diffRemoved").fg,
  git_add = get_highlight("diffAdded").fg,
  git_change = get_highlight("diffChanged").fg,
}

heirline.load_colors(colors)

