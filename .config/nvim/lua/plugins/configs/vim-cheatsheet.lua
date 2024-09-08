return {
  'reireias/vim-cheatsheet',
  config = function()
    vim.cmd([[let g:cheatsheet#cheat_file = '~/dotfiles/cheatsheet.md']])
  end
}
