return {
  'lewis6991/gitsigns.nvim',
   event = "VeryLazy",
  config = function()
    require('gitsigns').setup({
      word_diff = true,
    })
  end,
  keys = {
    { '<leader>gb', '<cmd>Gitsigns blame<cr>',        desc = 'Blame' },
    { '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview Hunk' },
    { '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>',   desc = 'Reset Hunk' },
    { '<leader>gR', '<cmd>Gitsigns reset_buffer<cr>', desc = 'Reset Buffer' },
    { '<leader>gm', '<cmd>Gitsigns change_base main<cr>', desc = 'Change Base to Main' },
    { '<leader>gH', '<cmd>Gitsigns change_base HEAD<cr>', desc = 'Change Base to HEAD' },
  },
}
