return function()
  require("local-highlight").setup({
    file_types = { "python", "lua" },
    hlgroup = "TSDefinitionUsage"
  })
end
