-- Avoid expensive global variable searching by this simple LOC!
local api = vim.api
-- also this... awd
local o = api.nvim_set_option_value
-- Also this! :3
local autocmd = api.nvim_create_autocmd

-- Alright! We're going to the Autocmds here!
-- First, this autocmd disables realtivenumbers when we're in insert mode.
-- Since, we really don't need those there.
autocmd({ "InsertEnter" }, {
  callback = function()
    o("relativenumber", false, {})
  end
})

-- This enables relativenumbers when we exisited insert mode.
-- This is because, realtivenumbers can be more useful somehow.
autocmd({ "InsertLeave" }, {
  callback = function()
    o("relativenumber", true, {})
  end
})

-- This is about it!
