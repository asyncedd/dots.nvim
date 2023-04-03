return function(vim_options, opts)
  assert(type(opts) == "table", "opts must be a table")
  for k, v in pairs(opts) do
    vim_options[k] = v
  end
  return vim_options
end
