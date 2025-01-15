return {
  'ruifm/gitlinker.nvim',
  config = function()
    require('gitlinker').setup()
    vim.api.nvim_set_keymap(
      'n', '<leader>gl',
      '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
      { silent = true }
    )
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
