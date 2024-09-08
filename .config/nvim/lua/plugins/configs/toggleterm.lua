return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({})
    vim.keymap.set('n', '<space>ot', ':ToggleTerm direction=float<CR>')
    vim.keymap.set('n', '<C-T>', ':ToggleTerm direction=float<CR>', { silent = true })
    vim.keymap.set('t', '<C-T>', '<C-\\><C-n>:FloatermToggle<CR>:ToggleTerm direction=float<CR>', { silent = true })
  end,
}
