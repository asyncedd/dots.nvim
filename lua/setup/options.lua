local opts = require("options.opts")

for k, v in pairs(opts) do
  vim.o[k] = v
end
