return {
  -- NOTE: Install all of these.
  ensure_installed = {
    "vim",
    "lua",
    -- Enable highlighting for Vim help files.
    -- EG: :h LSP
    "vimdoc",
    "query",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
    -- Enable Lua patterns highlighting.
    "luap",
    -- Enable Lua docs.
    "luadoc",
    -- HACK: Since, we override filetypes for NEOGITCOMMITMESSAGE filetypes, so Treesitter might not install these.
    "git_rebase",
    "gitcommit",
  },

  -- Auto install parsers once we enter a buffer.
  -- BUG: This is super buggy and WILL show like a billion errors.
  -- More information in the README.
  auto_install = true,

  -- Enable highlighting.
  -- Otherwise, the whole plugin will be disabled.
  highlight = {
    enable = true,
    -- NOTE: If you want to use Vim's regex highlighting (which is really unrecommended,
    -- since, it's resource intensive and, will show wrong highlights),
    -- You can still enable it via un-commenting the following line at L32.
    -- It'll NEVER BE SUPPORTED.

    -- additional_vim_regex_highlighting = true
  },

  indent = {
    -- Enable Treesitter-based indentation.
    -- It'll override the `=` operator and, others.
    enable = true,
  },
}
