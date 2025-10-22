return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
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
        'sql',
        'xml',
      },
      auto_install = true,
      sync_install = false,
      modules = {},
      ignore_install = {},
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
