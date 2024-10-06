return {
  'shortcuts/no-neck-pain.nvim',
  config = function()
    require('no-neck-pain').setup({
      width = 120,
    })

    vim.keymap.set('n', '<leader>cc', ':NoNeckPain<CR>')
  end,
}
