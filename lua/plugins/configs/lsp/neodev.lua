return function(opts)
  local status, neodev = pcall(require, "neodev")
  if not status then
    return false
  end

  neodev.setup({
    library = {
      plugins = opts.plugins,
      runtime = opts.runtime,
      types = opts.types,
    },
  })
end
