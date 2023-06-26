local M = {}

M.treesitter = {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.Comment = {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

M.Mini = {
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  },
  mappings = {
    comment = "",
    comment_line = "",
    textobject = "gc",
  },
}

return M
