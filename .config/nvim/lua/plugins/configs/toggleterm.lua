return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({})
    vim.keymap.set('n', '<space>ot', ':ToggleTerm direction=float<CR>')
    vim.keymap.set('n', '<M-t>', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
    vim.keymap.set('t', '<M-t>', '<C-\\><C-n>:ToggleTerm direction=float<CR>', { noremap = true, silent = true })

    -- Start insert mode when entering terminal
    local augroup_term_insert = vim.api.nvim_create_augroup("Term-Insert", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter", "TermOpen", "TermEnter" }, {
      group = augroup_term_insert,
      pattern = 'term://*',
      callback = function()
        vim.cmd('startinsert')
      end
    })
  end,
}
