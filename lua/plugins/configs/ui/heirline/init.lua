local lazy_require = require("snips.lazy-require").require_on_index

local coroutine_list = {}

-- Define a function to wrap require calls in a coroutine
local function require_coroutine(module_name)
  local module = require(module_name)
  coroutine.yield(module)
end

-- Create a coroutine for each module you want to require
table.insert(coroutine_list, coroutine.create(function() return lazy_require("heirline") end))
table.insert(coroutine_list, coroutine.create(function() return require("plugins.configs.ui.heirline.bufferline") end))
table.insert(coroutine_list, coroutine.create(function() return require("plugins.configs.ui.heirline.statusline") end))
table.insert(coroutine_list, coroutine.create(function() return require("plugins.configs.ui.heirline.colors") end))

-- Resume all coroutines in parallel and store the results
local results = {}
for _, co in ipairs(coroutine_list) do
  local ok, result = coroutine.resume(co)
  if not ok then
    error(result)
  end
  table.insert(results, result)
end

-- Unpack the results and call the setup function with the appropriate arguments
results[1].setup({
  statusline = results[3],
  tabline = results[2],
})

