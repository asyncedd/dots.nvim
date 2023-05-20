return {
  mappings = {
    nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
      motions = {
        new_trail_mark = "<leader>mm",
        track_back = "<leader>mn",
        peek_move_next_down = "<leader>mj",
        peek_move_previous_up = "<leader>mk",
        move_to_nearest = "<leader>mb",
        toggle_trail_mark_list = "<leader>mh",
      },
      actions = {
        delete_all_trail_marks = "<leader>md",
      },
    },
  },
}
