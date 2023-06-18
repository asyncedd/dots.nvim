local function add_missing_items(t1, t2)
  for i, v in ipairs(t2) do
    local y = false
    for _, value in ipairs(t1) do
      if value == v then
        y = true
        break
      end
    end
    if not y then
      table.insert(t1, v)
    end
  end
  return t1
end

local augend = require("dial.augend")

local M = {}

M.ft = {}

M.ft["lua"] = {
  augend.constant.new({
    elements = {
      "and",
      "or",
      "not",
    },
    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
  }),
}

M.config = function()
  local default = {
    augend.constant.alias.bool,
    augend.semver.alias.semver,
    augend.integer.new({
      natural = false,
    }),
    augend.date.alias["%Y/%m/%d"],
  }

  require("dial.config").augends:register_group({
    default = default,
    ["lua"] = add_missing_items(M.ft["lua"], default),
  })
end

return M
