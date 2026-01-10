return {
  'ruifm/gitlinker.nvim',
  config = function()
    require('gitlinker').setup()
  end,
  keys = {
    { '<leader>go', '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', desc = 'Get Git Link' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
