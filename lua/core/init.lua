-- Neoinit v.0.1

-- Load the configuration file.
local config = require("user.settings")

-- Define a function that takes a thunk and executes it in a separate coroutine
local function runInCoroutine(thunk)
  local co = coroutine.create(thunk)
  coroutine.resume(co)
end

-- Define a thunk that performs some task
local function disableBuiltinPlugins()
  -- Disable builtin Plugins.
  require("core.disableBuiltinPlugins")
end

local function options()
  -- Set the options.
  require("user.options")
end

-- Create multiple thunks to execute in parallel
local thunks = {
  disableBuiltinPlugins,
  options,
}

-- Execute each thunk in a separate coroutine
for _, thunk in ipairs(thunks) do
  runInCoroutine(thunk)
end

-- Bootstrap Lazy.nvim
require("core.bootstrap")

-- Initalize lazy.nvim
require("core.lazy")

-- Set the colorscheme.
local colorscheme = require("user.settings.colorscheme")
vim.api.nvim_command("colorscheme " .. colorscheme)

