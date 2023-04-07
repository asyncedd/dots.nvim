return {
  json = {
    schemas = require("schemastore").json.schemas(),
    select = {
      ".eslintrc",
      "package.json",
    },
  },
  validate = { enable = true },
}
