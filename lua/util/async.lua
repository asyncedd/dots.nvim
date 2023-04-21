local M = {}

-- Run a function asynchronously
function M.async(func)
  return function(...)
    local co = coroutine.create(func)
    local args = ({...})
    local resume = function()
      local ok, result = xpcall(function()
        return ({coroutine.resume(co, unpack(args, 1, #args))})
      end, debug.traceback)
      if ok then
        return unpack(result, 1, #result)
      else
        error(result[1])
      end
    end
    return {
      await = function()
        local result
        vim.schedule(function()
          result = ({resume()})
        end)
        coroutine.yield()
        if #result == 0 then
          return nil
        elseif #result == 1 then
          return result[1]
        else
          return unpack(result, 1, #result)
        end
      end
    }
  end
end


-- Run a table of functions asynchronously in parallel
function M.parallel(funcs)
  local results = {}
  for i, func in ipairs(funcs) do
    results[i] = M.async(coroutine.wrap(func))()
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

