return {
  'ruifm/gitlinker.nvim',
  config = function()
    require('gitlinker').setup()
  end,
  keys = {
    {
      '<leader>Gy',
      '<cmd>lua require("gitlinker").get_buf_range_url("n")<cr>',
      desc = 'Copy Git Link',
    },
    {
      '<leader>Gy',
      '<cmd>lua require("gitlinker").get_buf_range_url("n")<cr>',
      mode = 'v',
      desc = 'Copy Git Link',
    },
    {
      '<leader>Go',
      '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
      desc = 'Open Git Link',
    },
    {
      '<leader>Go',
      '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
      mode = 'v',
      desc = 'Open Git Link',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
