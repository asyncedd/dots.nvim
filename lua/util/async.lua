local M = {}

-- Run a function asynchronously
function M.async(func)
  return function(...)
    local co = coroutine.wrap(func)
    local nargs = select("#", ...)
    local args = {...}
    return {
      await = function()
        local result = {co(table.unpack(args, 1, nargs))}
        if result[1] then
          return table.unpack(result, 2)
        else
          error(result[2])
        end
      end
    }
  end
end


-- Run a table of functions asynchronously in parallel
function M.parallel(funcs)
  local co = coroutine.create(function()
    local results = {}
    for i, func in ipairs(funcs) do
      results[i] = M.async(func)()
    end
    coroutine.yield(results)
  end)
  return {
    await = function()
      local ok, results = coroutine.resume(co)
      if ok then
        local final_results = {}
        for i, result in ipairs(results) do
          final_results[i] = result.await()
        end
        return final_results
      else
        error(results)
      end
    end
  }
end

return M

