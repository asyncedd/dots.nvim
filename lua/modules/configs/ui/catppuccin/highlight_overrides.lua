local M

M = function (cp)
  return {
    Type = { fg = cp.blue },
    Typedef = { fg = cp.yellow },

    -- For Fidget
    FidgetTask = { bg = cp.none, fg = cp.surface2 },
    FidgetTitle = { fg = cp.blue, style = { "bold" } }
  }
end

return M
