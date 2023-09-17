vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap

keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
keymap('n', 'j', 'gj', { noremap = true })
keymap('n', 'k', 'gk', { noremap = true })
keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', {})
