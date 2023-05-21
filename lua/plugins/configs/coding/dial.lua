local M = {}

M.config = function()
  local augend = require("dial.augend")

  local default = {
    augend.constant.alias.bool,
    augend.integer.alias.decimal,
    augend.semver.alias.semver,
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.Alpha,
    augend.constant.alias.alpha,
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
  }

  local lua = {
    augend.constant.new({
      elements = {
        "and",
        "or",
        "not",
      },
      word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    }),
  }

  require("dial.config").augends:register_group({
    default = default,
  })
end

return M
