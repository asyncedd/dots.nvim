---@type ChadrcConfig
local M = {}
local utils = require("nvchad.stl.utils")

M.ui = {
  theme = "everblush",
  statusline = {
    -- order = {
    --   "mode",
    --   "file",
    --   "git",
    --   "%=",
    --   "diagnostics",
    --   "cwd",
    --   "cursor",
    -- },
    modules = {
      git = function()
        local git_status = vim.b[utils.stbufnr()].minigit_summary_string or ""

        local summary = vim.b[utils.stbufnr()].minigit_summary
        local branch_name = (summary ~= nil and summary.head_name) and (" " .. git_status) or ""

        summary = vim.b.minidiff_summary
        return "%#St_gitIcons# "
          .. branch_name
          .. (
            summary ~= nil
              and " " .. ((summary.add ~= nil and summary.add > 0) and dots.UI.icons.Git.added .. summary.add or "") .. ((summary.change ~= nil and summary.change > 0) and dots.UI.icons.Git.changed .. summary.change or "") .. ((summary.delete ~= nil and summary.delete > 0) and dots.UI.icons.Git.remove .. summary.delete or "")
            or ""
          )
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
