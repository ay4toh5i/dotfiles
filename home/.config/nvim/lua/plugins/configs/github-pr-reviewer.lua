return {
  "otavioschwanck/github-pr-reviewer.nvim",
  opts = {
    -- options here
  },
  keys = {
    {
      "<leader>gR",
      "<cmd>PRReviewMenu<cr>",
      desc = "PR Review Menu",
    },
    {
      "<leader>gS",
      ":<C-u>'<,'>PRSuggestChange<CR>",
      mode = "v",
      desc = "Suggest change",
    }
  }
}
