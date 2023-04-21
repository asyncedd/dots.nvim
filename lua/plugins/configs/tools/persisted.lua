require("persisted").setup({
  save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
  silent = false, -- silent nvim message when sourcing session file
  use_git_branch = true, -- create session files based on the branch of the git enabled repository
  autosave = true, -- automatically save session files when exiting Neovim
  follow_cwd = true, -- change session file name to match current working directory if it changes
  telescope = { -- options for the telescope extension
    reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
  },
})
