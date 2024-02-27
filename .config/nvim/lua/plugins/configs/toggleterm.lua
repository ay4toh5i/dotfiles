return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({})
    vim.keymap.set('n', '<space>ot', ':ToggleTerm direction=float<CR>')
  end,
}
