local function set_vim_options(options)
  for _, opt in ipairs(options) do
    assert(type(opt.name) == "string", "Option name must be a string")
    assert(type(opt.value) == "string" or type(opt.value) == "number" or type(opt.value) == "boolean", "Option value must be a string, number, or boolean")
    opt.modifier[opt.name] = opt.value
  end
end

return set_vim_options
