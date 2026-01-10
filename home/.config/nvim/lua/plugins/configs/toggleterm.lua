return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      direction = 'float',
      start_in_insert = true,
      persist_mode = false,
      float_opts = {
        border = 'curved',
      }
    })
  end,
  keys = {
    {
      '<space>ot',
      ':ToggleTerm<CR>',
      desc = 'Toggle terminal',
      silent = true,
    },
    {
      '<M-t>',
      ':ToggleTerm<CR>',
      desc = 'Toggle terminal',
      silent = true,
    },
    {
      '<M-t>',
      '<C-\\><C-n>:ToggleTerm<CR>',
      mode = 't',
      desc = 'Toggle terminal',
      silent = true,
    },
  },
}
