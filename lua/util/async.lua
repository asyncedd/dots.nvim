function get_values_from_array(array)
  local co = coroutine.create(function()
    for _, pair in ipairs(array) do
      local n, o = pair[1], pair[2]
      coroutine.yield(n, o)
    end
  end)

  return function()
    local success, n, o = coroutine.resume(co)
    if success then
      return n, o
    end
  end
end

return function (array)
  local get_next_value = get_values_from_array(array)
  while true do
    local n, o = get_next_value()
    if not n then break end

    -- print(n .. o)
    vim.o[n] = o
  end
end
