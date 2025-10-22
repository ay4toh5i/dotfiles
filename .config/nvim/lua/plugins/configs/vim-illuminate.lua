return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      filetypes_denylist = {
        'toggleterm',
        'TelescopePrompt',
        'alpha',
        'lazy',
        'mason',
        'notify',
        'packer',
        'spectre_panel',
        'which-key',
        'neo-tree',
      },
    })
  end,
}
