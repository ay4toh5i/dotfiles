vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap

keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
keymap('n', 'j', 'gj', { noremap = true })
keymap('n', 'k', 'gk', { noremap = true })
keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { silent = true })

keymap('n', '<C-h>', ':bprev<CR>', { silent = true })
keymap('n', '<C-l>', ':bnext<CR>', { silent = true })
keymap('n', '<C-i>', ':b#<CR>', { silent = true})
