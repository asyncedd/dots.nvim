return function(opts)
  local Hydra = require("hydra")

  for i, _ in ipairs(opts) do
    Hydra(opts[i])
  end
end
