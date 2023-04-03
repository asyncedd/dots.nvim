local o = vim.api.nvim_set_option_value
local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

autocmd({ "InsertEnter" }, {
  group = augroup("ln_on_ie"),
  callback = function()
    o("relativenumber", false, {})
  end
})

autocmd({ "InsertLeave" }, {
  group = augroup("ln_on_ie"),
  callback = function()
    o("relativenumber", true, {})
  end
})


