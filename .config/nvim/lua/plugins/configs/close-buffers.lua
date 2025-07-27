return {
  'kazhala/close-buffers.nvim',
  config = function()
  end,
  keys = {
    { '<leader>bd', '<cmd>bd<cr>', desc = 'Delete Current Buffer' },
    { '<leader>bD', '<cmd>lua require("close_buffers").delete({type = "hidden"})<cr>', desc = 'Delete Hidden Buffers' },
  },
}
