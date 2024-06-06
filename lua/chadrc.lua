---@type ChadrcConfig
local M = {}
local utils = require("nvchad.stl.utils")

local diff_format_summary = function(data)
  local summary = vim.b[data.buf].minidiff_summary
  if summary == nil then
    vim.b[data.buf].minidiff_summary_string = ""
    return
  end
  local t = {}
  if summary.add ~= nil and summary.add > 0 then
    table.insert(t, dots.UI.icons.Git.added .. summary.add)
  end
  if summary.change ~= nil and summary.change > 0 then
    table.insert(t, dots.UI.icons.Git.changed .. summary.change)
  end
  if summary.delete ~= nil and summary.delete > 0 then
    table.insert(t, dots.UI.icons.Git.remove .. summary.delete)
  end
  vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
end
vim.api.nvim_create_autocmd("User", { pattern = "MiniDiffUpdated", callback = diff_format_summary })

-- Use only HEAD name as summary string
local git_format_summary = function(data)
  -- Utilize buffer-local table summary
  local summary = vim.b[data.buf].minigit_summary
  vim.b[data.buf].minigit_summary_string = (summary ~= nil and summary.head_name) or ""
end

vim.api.nvim_create_autocmd("User", { pattern = "MiniGitUpdated", callback = git_format_summary })

M.ui = {
  theme = "everblush",
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
        local git_status = vim.b[utils.stbufnr()].minigit_summary_string or ""

        local branch_name = " " .. git_status

        return "%#St_gitIcons# " .. branch_name .. " " .. (vim.b[utils.stbufnr()].minidiff_summary_string or "")
      end,
    },
  },
  hl_override = {
    DiffAdd = { fg = "green" },
    DiffModified = { fg = "yellow" },

    FloatBorder = { fg = "darker_black", bg = "darker_black" },
    NormalFloat = { bg = "darker_black" },
  },
  hl_add = {
    MiniDiffSignAdd = { fg = "green" },
    MiniDiffSignChange = { fg = "yellow" },
    MiniDiffSignDelete = { fg = "red" },

    MiniNotifyNormal = { link = "Normal" },
  },
}

return M
