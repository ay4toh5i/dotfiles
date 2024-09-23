return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'vim',
        'vimdoc',
        'lua',
        'rust',
        'go',
        'c',
        'query',
        'ruby',
        'python',
        'php',
        'typescript',
        'javascript',
        'tsx',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'json',
        'yaml',
        'toml',
        'regex',
        'hcl',
        'java',
        'kotlin',
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
