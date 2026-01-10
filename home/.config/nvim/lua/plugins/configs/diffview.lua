return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gdo', '<cmd>DiffviewOpen<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gdc', '<cmd>DiffviewClose<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gdh', '<cmd>DiffviewFileHistory %<cr>', { noremap = true, silent = true })
    vim.keymap.set('x', 'gdh', ":DiffviewFileHistory<cr>", { noremap = true, silent = true })
  end
}
