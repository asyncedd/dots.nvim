require("trailblazer").setup({
  mappings = {
    nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
      motions = {
        new_trail_mark = "Ma",
        track_back = "Mb",
        peek_move_next_down = "Mj",
        peek_move_previous_up = "Mk",
        toggle_trail_mark_list = "MM",
      },
      actions = {
        delete_all_trail_marks = "ML",
        paste_at_last_trail_mark = "Mn",
        paste_at_all_trail_marks = "MN",
        set_trail_mark_select_mode = "Mt",
        switch_to_next_trail_mark_stack = "M[",
        switch_to_previous_trail_mark_stack = "M]",
        set_trail_mark_stack_sort_mode = "Ms",
      },
    },
  },
})
