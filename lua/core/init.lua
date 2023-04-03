-- lua/core/init.lua
-- This is the place where the magic happens!

local threads = {}

table.insert(threads, function ()
  -- Set the <leader> key to: <Space>
  -- So we can go for ex. -> `<leader>ff` to open Telescope.nvim.
  -- Quite useful ain't it? :)
  vim.g.mapleader = " "
end)

table.insert(threads, function ()
  -- Disable builtin plugins (Using the g.loaded method so it's not real :()
  require("core.disableBuiltinPlugins")
end)

table.insert(threads, function ()
  -- Set the package.path.
  -- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
  package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path
  package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?/init.lua;" .. package.path
end)

table.insert(threads, function ()
  -- Set some options.
  -- Now, we can use shortcuts like `<leader>ff` to open Telescope.nvim.
  -- This will make out lives much easier! :D
  require("core.options")

  -- User provided stuff.
  require("core.user")
end)

local execute_threads = function ()
  -- Loop through each function in the 'threads' table
  for i, fn in ipairs(threads) do
    -- Yield the co-routine to allow other work to be done while executing the function
    coroutine.yield()

    -- Execute the current function
    fn()
  end
end

-- Create a co-routine for executing the functions in the 'threads' table
local thread_co = coroutine.create(execute_threads)

-- Loop through the co-routine until it has finished executing all functions in the 'threads' table
while coroutine.status(thread_co) ~= "dead" do
  coroutine.resume(thread_co)
end

-- Initalize the plugin manager, lazy.nvim.
-- We're gonna use the best tools for the job!
require("core.lazy")

-- Set up a colorscheme.
-- You can change the colorscheme you use at:
-- `lua/user/settings/init.lua`.
local colorscheme = require("user.settings").colorscheme

vim.cmd("colorscheme " .. colorscheme)

-- Initalize the Heirline.nvim color stuff since we need it.
-- require("plugins.configs.ui.heirline.colors")

vim.schedule(function()
  --   -- Load components in parallel using coroutines and thunks
  local function load_components(components)
    local thunks = {}
    for _, component in ipairs(components) do
      table.insert(thunks, function()
        require(component)
      end)
    end
    local co = coroutine.create(function()
      for _, thunk in ipairs(thunks) do
        thunk()
        coroutine.yield()
      end
    end)
    while coroutine.resume(co) do
    end
  end

  -- Load components in parallel
  vim.schedule(function()
    load_components({
      "core.autocmd",
      "mappings.movement",
      "mappings.lspsaga",
      "mappings.plugins",
    })
  end)

end)
-- Load options that don't require any UI
-- Moved this out of the options since it takes so long ;-;
vim.schedule(function()
  vim.o.clipboard = "unnamed,unnamedplus" -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)
end)

