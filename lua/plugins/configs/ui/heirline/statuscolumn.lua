local M = {}
local api = vim.api
local o = vim.opt
local gitsigns = require("gitsigns")

-- Line Number
M.line_number = {
  condition = function() return (o.number:get() or o.relativenumber:get()) end,
  provider = function()
    local num = o.number:get()
    local relnum = o.relativenumber:get()
    if (num and not relnum) then return "%l"
    elseif (relnum and not num) then return "%r"
    else return "%{v:relnum?v:relnum:v:lnum}" end
  end,
}

-- Signs
M.signs = {
  provider = "%s",
  hl = {
    bold = true
  },
}

M.gitsigns = {
  condition = function() return vim.b.nifoc_gitsigns_enabled == 1 end,
  init = function(self)
    local bufnr=api.nvim_get_current_buf()
    local lnum=vim.v.lnum
    local sign=vim.fn.sign_getplaced( bufnr, { group= "gitsigns_vimfn_signs_",id=lnum,lnum})[1].signs[1]
    self.sign=sign
    self.has_sign=(sign~=nil)
  end,
  provider = " ▏",
  on_click = {
    name = "heirline_statuscolumn_gitsigns",
    callback = function(_)
      local mouse=vim.fn.getmousepos()
      local cursor_pos={mouse.line,0}
      api.nvim_win_set_cursor(mouse.winid,cursor_pos)
      vim.defer_fn(function() gitsigns.blame_line({full=true}) end, 100)
    end
  }
}

M.gitsigns_or_bar = {
  condition = function() return not(vim.b.nifoc_gitsigns_enabled == 1) end,
  provider = "▏",
  M.gitsigns
}

return M
