return {
  'FabijanZulj/blame.nvim',
  config = function()
    require('blame').setup()
    vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<cr>', { noremap = true, silent = true })
  end
}
