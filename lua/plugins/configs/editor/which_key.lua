return {
  presets = {
    operators = true, -- adds help for operators like d, y, ...
    motions = true, -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = true, -- default bindings on <c-w>
    nav = true, -- misc bindings to work with windows
    z = true, -- bindings for folds, spelling and others prefixed with z
    g = true, -- bindings for prefixed with g
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  motion = {
    count = true,
    leap = "s",
    ["leap-spooky"] = { "r", "R", "m", "M" },
  },
}
