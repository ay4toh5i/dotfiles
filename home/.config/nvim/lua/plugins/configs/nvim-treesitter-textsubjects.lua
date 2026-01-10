return {
  'rrethy/nvim-treesitter-textsubjects',
  enabled = false, -- enable when this plugin supports nvim-treesitter main branch(https://github.com/RRethy/nvim-treesitter-textsubjects/issues/52).
  config = function()
    require('nvim-treesitter-textsubjects').configure({
      prev_selection = ',',
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    })
  end
}
