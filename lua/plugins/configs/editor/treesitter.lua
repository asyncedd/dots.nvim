return {
  -- NOTE: Install all of these.
  ensure_installed = {
    -- NOTE: You may think that you don't need the Vimscript parser if you mainly use Lua.
    -- But, that's simply not true (unless you don't use `vim.cmd` or something similar).
    -- It actually shows syntax highlighting in `vim.cmd`!
    "vim",
    "lua",
    -- Enable highlighting for Vim help files.
    -- EG: :h LSP
    "vimdoc",
    "query",
    "regex",
    "bash",
    -- NOTE: If you don't do Markdown stuff (I bet you do Markdown stuff though), you still don't want to remove this.
    -- Noice.nvim requires this parser so, we have some Markdown-highighting in some other places! 🤯
    "markdown",
    "markdown_inline",
    -- Enable Lua patterns highlighting.
    "luap",
    -- Enable Lua docs.
    "luadoc",
    -- HACK: Since, we override filetypes for NEOGITCOMMITMESSAGE filetypes, so Treesitter might not install these.
    "git_rebase",
    "gitcommit",
    -- NOTE: Diff is needed for LSPsaga.
    "diff",
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
