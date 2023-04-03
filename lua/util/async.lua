local M = {}

-- Run a function asynchronously
function M.async(func)
  return function(...)
    local co = coroutine.create(func)
    local args = {...}
    local resume = function()
      local ok, result = xpcall(function()
        return {coroutine.resume(co, unpack(args))}
      end, debug.traceback)
      if ok then
        return unpack(result)
      else
        error(result)
      end
    end
    return {
      await = function()
        local results = {vim.wait(0, resume)}
        if #results == 0 then
          return nil
        elseif #results == 1 then
          return results[1]
        else
          return unpack(results)
        end
      end
    }
  end
end

-- Run a table of functions asynchronously in parallel
function M.parallel(funcs)
  local results = {}
  for i, func in ipairs(funcs) do
    results[i] = M.async(func)()
  end
  return {
    await = function()
      local final_results = {}
      for i, result in ipairs(results) do
        final_results[i] = result.await()
      end
      return final_results
    end
  }
end

return M
