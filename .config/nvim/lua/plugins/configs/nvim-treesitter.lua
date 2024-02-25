return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function () 
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 
        'vim',
        'vimdoc',
        'lua',
        'rust',
        'go',
        'c',
        'query',
        'typescript',
        'javascript',
        'tsx',
        'html',
        'css',
        'markdown',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },  
      matchup = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    })
  end,
  dependencies = {
    { 'andymass/vim-matchup' },
    { 'RRethy/nvim-treesitter-endwise' },
  }
}
