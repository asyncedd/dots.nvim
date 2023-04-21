return function()
  require("kanagawa").setup({
    compile = true,
    undercurl = true,
    commentStyle = { italc = true },
    functionStyle = { italic = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    dimInactive = true,
    terminalColors = true,
    theme = "wave",
  })
end
