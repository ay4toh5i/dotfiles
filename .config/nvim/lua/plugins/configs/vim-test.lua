return {
  'vim-test/vim-test',
  config = function()
    vim.cmd([[
      let test#strategy = 'toggleterm'
    ]])

    vim.keymap.set('n', '<space>tn', ':TestNearest<CR>')
    vim.keymap.set('n', '<space>tf', ':TestFile<CR>')
    vim.keymap.set('n', '<space>ts', ':TestSuite<CR>')
    vim.keymap.set('n', '<space>tl', ':TestLast<CR>')
  end
}
