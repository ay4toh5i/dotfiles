return {
  'shortcuts/no-neck-pain.nvim',
  config = function()
    require('no-neck-pain').setup({
      width = 125,
      buffers = {
        wo = {
          fillchars = "eob: ",
        },
      }
    })

    vim.keymap.set('n', '<leader>cc', ':NoNeckPain<CR>')
  end,
}
