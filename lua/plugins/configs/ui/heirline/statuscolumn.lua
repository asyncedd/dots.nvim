local M = {}
local o = vim.opt

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

return M
