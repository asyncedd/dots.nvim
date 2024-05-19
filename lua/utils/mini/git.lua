local function is_valid_git_repo(buf_id)
  -- Check if it's a valid buffer
  local path = vim.api.nvim_buf_get_name(buf_id)
  if path == "" or vim.fn.filereadable(path) ~= 1 then
    return false
  end

  -- Check if the current directory is a Git repository
  if vim.fn.isdirectory(".git") == 0 then
    return false
  end

  return true
end

local branch_cache = {}

-- Function to clear the Git branch cache
local function clear_git_branch_cache()
  -- Clear by doing an empty table :)
  branch_cache = {}
end

-- Autocommand to clear the Git branch cache when the directory changes
vim.api.nvim_create_autocmd("DirChanged", {
  callback = clear_git_branch_cache,
})

local function update_git_branch(data)
  if not is_valid_git_repo(data.buf) then
    return
  end

  -- Check if branch is already cached
  local cached_branch = branch_cache[data.buf]
  if cached_branch then
    vim.b.git_branch = cached_branch
    return
  end

  local stdout = vim.uv.new_pipe(false)
  local handle, pid
  handle, pid = vim.uv.spawn(
    "git",
    {
      args = { "-C", vim.fn.expand("%:p:h"), "branch", "--show-current" },
      stdio = { nil, stdout, nil },
    },
    vim.schedule_wrap(function(code, signal)
      if code == 0 then
        stdout:read_start(function(err, content)
          if content then
            vim.b.git_branch = content:gsub("\n", "") -- Remove newline character
            branch_cache[data.buf] = vim.b.git_branch -- Cache the branch name
            stdout:close()
          end
        end)
      else
        stdout:close()
      end
    end)
  )
end

-- Call this function when the buffer is opened in a window
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = update_git_branch,
})
