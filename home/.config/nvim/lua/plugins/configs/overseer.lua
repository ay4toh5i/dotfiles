return {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup()
    vim.keymap.set('n', '<leader>rr', ':OverseerRun<CR>')
    vim.keymap.set('n', '<leader>rt', ':OverseerToggle<CR>')
  end,
}
