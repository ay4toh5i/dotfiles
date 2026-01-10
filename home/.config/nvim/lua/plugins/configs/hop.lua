return {
    'smoka7/hop.nvim',
    version = "*",
    config = function ()
      require('hop').setup()
      vim.keymap.set('n', '<leader><leader>w', '<cmd>HopWordAC<cr>')
      vim.keymap.set('n', '<leader><leader>W', '<cmd>HopCamelCaseAC<cr>')
      vim.keymap.set('n', '<leader><leader>b', '<cmd>HopWordBC<cr>')
      vim.keymap.set('n', '<leader><leader>B', '<cmd>HopCamelCaseBC<cr>')
      vim.keymap.set('n', '<leader><leader>j', '<cmd>HopLineStartAC<cr>')
      vim.keymap.set('n', '<leader><leader>k', '<cmd>HopLineStartBC<cr>')
    end,
}
