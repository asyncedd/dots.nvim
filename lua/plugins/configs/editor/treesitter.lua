return {
  -- A list of parser names, or "all" (the five listed parsers should always be installed) 
  ensure_installed = {
    "lua",
    "luap",
    "luadoc",
    "markdown_inline",
    "markdown",
    "vim",
    "vimdoc",
    "query",
    "regex",
    "bash",
    "fish",
  },

  -- Check https://github.com/nvim-treesitter/nvim-treesitter/wiki/Linux-Support.

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally  
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },
}
