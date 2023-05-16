local M = {}

M.upair = {
  space = {
    enable = true,
  },
  space2 = {
    enable = true,
  },
  internal_pairs = {
    {
      "[",
      "]",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      fastwarp = true,
      backspace_suround = true,
    },
    {
      "(",
      ")",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      fastwarp = true,
      backspace_suround = true,
    },
    {
      "{",
      "}",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      fastwarp = true,
      backspace_suround = true,
    },
    {
      '"',
      '"',
      suround = true,
      rules = { { "when", { "filetype", "vim" }, { "not", { "regex", "^%s*$" } } } },
      string = true,
    },
    {
      "'",
      "'",
      suround = true,
      rules = {
        { "when", { "option", "lisp" }, { "not", { "regex", "^%s*$" } }, { "instring" } },
      },
      alpha = true,
      nft = {
        "tex",
      },
      string = true,
    },
    { "`", "`", nft = { "tex" } },
    { "``", "''", ft = { "tex" } },
    { "```", "```", newline = true, ft = { "markdown" } },
    { "<!--", "-->", ft = { "markdown", "html" } },
    { '"""', '"""', newline = true, ft = { "python" } },
    { "'''", "'''", newline = true, ft = { "python" } },
    { "string", type = "tsnode", string = true },
    { "raw_string", type = "tsnode", string = true },
  },
}

return M
