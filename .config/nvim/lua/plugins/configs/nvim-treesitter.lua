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
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },  
    })
  end,
}
