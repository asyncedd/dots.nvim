local M = {}

-- Run a function asynchronously
function M.async(func)
  return function(...)
    local co = coroutine.create(func)
    local args = {...}
    return {
      await = function()
        local ok, result = coroutine.resume(co, table.unpack(args))
        if ok then
          return result
        else
          error(result)
        end
      end
    }
  end
end


-- Run a table of functions asynchronously in parallel
function M.parallel(funcs)
  local co_results = {}
  for i, func in ipairs(funcs) do
    co_results[i] = coroutine.create(function()
      local result = func()
      coroutine.yield(result)
    end)
  end
  return {
    await = function()
      local final_results = {}
      for i, co in ipairs(co_results) do
        local ok, result = coroutine.resume(co)
        if ok then
          final_results[i] = result
        else
          error(result)
        end
      end
      return final_results
    end
  }
end


return M
