return {
  'kazhala/close-buffers.nvim',
  config = function()
  end,
  keys = {
    {
      '<leader>bd',
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      desc = 'Delete Current Buffer',
    },
    {
      '<leader>bD',
      function()
        require('close_buffers').wipe({ type = 'other' })
      end,
      desc = 'Delete Other Buffers',
    },
  },
}
