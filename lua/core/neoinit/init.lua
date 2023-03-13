-- Create quick autocmds for plugins.
-- require("core.neoinit.plugins")

-- Load scripts from directory
local function load_scripts(directory_path)
  local scripts = {}
  for file in io.popen('ls "' .. directory_path .. '"'):lines() do
    local script_path = directory_path .. '/' .. file
    if file ~= "init.lua" then
      local script = dofile(script_path)
      table.insert(scripts, script)
    end
  end
  return scripts
end

-- Check script for required fields
local function check_script(script)
  return script.event and script.priority and script.script
end

-- Run scripts in parallel
local function run_scripts(scripts)
  table.sort(scripts, function(a, b) return a.priority < b.priority end)
  for _, script in ipairs(scripts) do
    if check_script(script) then
      coroutine.wrap(script.script)()
    else
      print('Error: Invalid script format')
    end
  end
end

-- Example usage
local scripts = load_scripts(vim.fn.stdpath("config") .. "/lua/core/neoinit")
run_scripts(scripts)
