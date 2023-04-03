return function(opts)
  local function set_options(opts)
    for k, v in pairs(opts) do
      vim.o[k] = v
    end
  end

  local co = coroutine.create(function()
    set_options(opts)
  end)

  coroutine.resume(co)
end
