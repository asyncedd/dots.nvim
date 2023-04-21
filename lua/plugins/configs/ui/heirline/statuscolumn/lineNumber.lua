local o = vim.opt

local lineNumber = {
  condition = function()
    return (o.number:get() or o.relativenumber:get())
  end,
  provider = function()
    local num = o.number:get()
    local relnum = o.relativenumber:get()
    if num and not relnum then
      return "%#LineNr#%l%#" -- Highlight the line number using the "LineNr" highlight group
    elseif relnum and not num then
      return " %r"
    else
      return "%{v:relnum?v:relnum:v:lnum}"
    end
  end,
}

vim.cmd()

return lineNumber
