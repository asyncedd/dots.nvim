local M = {}

M.treesitter = {
  context_commentstring = {
    enable = true,
  },
}

M.Comment = {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

return M
