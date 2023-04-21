local opts = require("user.options")

for k, v in pairs(opts) do
  vim.opt[k] = v
end
