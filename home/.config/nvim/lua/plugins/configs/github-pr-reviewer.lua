return {
  "otavioschwanck/github-pr-reviewer.nvim",
  opts = {
    mark_as_viewed_key = "<leader><CR>",    -- key to mark file as viewed and go to next file
    next_hunk_key = "<leader><C-j>",        -- key to jump to next hunk
    prev_hunk_key = "<leader><C-k>",        -- key to jump to previous hunk
    next_file_key = "<leader><C-l>",        -- key to go to next modified file
    prev_file_key = "<leader><C-h>",        -- key to go to previous modified file
    diff_view_toggle_key = "<leader><C-v>", -- toggle between unified and split diff view
    toggle_floats_key = "<leader><C-r>",    -- toggle floating windows visibility
  },
  keys = {
    {
      "<leader>Gr",
      "<cmd>PRReviewMenu<cr>",
      desc = "PR Review Menu",
    },
    {
      "<leader>Gs",
      ":<C-u>'<,'>PRSuggestChange<CR>",
      mode = "v",
      desc = "Suggest change",
    }
  }
}
