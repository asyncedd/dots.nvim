local M = {}
local utils = require("nvchad.stl.utils")
require("utils.mini.git")

local format_summary = function(data)
  local summary = vim.b[data.buf].minidiff_summary
  if summary == nil then
    vim.b[data.buf].minidiff_summary_string = ""
    return
  end
  local t = {}
  if summary.add > 0 then
    table.insert(t, dots.UI.icons.Git.added .. summary.add)
  end
  if summary.change > 0 then
    table.insert(t, dots.UI.icons.Git.changed .. summary.change)
  end
  if summary.delete > 0 then
    table.insert(t, dots.UI.icons.Git.remove .. summary.delete)
  end
  vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
end
local au_opts = { pattern = "MiniDiffUpdated", callback = format_summary }
vim.api.nvim_create_autocmd("User", au_opts)

M.ui = {
  theme = "onedark",
  statusline = {
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "diagnostics",
      "cwd",
      "cursor",
    },
    modules = {
      git = function()
        if not vim.b[utils.stbufnr()].git_branch or not vim.b[utils.stbufnr()].minidiff_summary_string then
          return ""
        end

        local git_status = vim.b[utils.stbufnr()].git_branch

        local branch_name = " " .. git_status

        return "%#St_gitIcons# " .. branch_name .. " " .. vim.b[utils.stbufnr()].minidiff_summary_string
      end,
    },
  },
}

return M
