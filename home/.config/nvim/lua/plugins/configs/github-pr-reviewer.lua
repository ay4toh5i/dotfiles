return {
  "otavioschwanck/github-pr-reviewer.nvim",
  event = "VeryLazy",
  config = function()
    require("github-pr-reviewer").setup()
  end,
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
