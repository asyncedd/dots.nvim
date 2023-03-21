return function()
  local no_preview = function()
    return require('telescope.themes').get_dropdown({
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
        results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
      width = 0.8,
      previewer = false,
      prompt_title = false
    })
  end

  -- then use it on whatever picker you want
  -- ex:
  vim.keymap.set("n", "<leader>ff", function() require"telescope.builtin".find_files(no_preview())end)
end
