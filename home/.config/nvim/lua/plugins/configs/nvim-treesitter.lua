local languages = {
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
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  dependencies = {
    {
      'andymass/vim-matchup',
      config = function()
        vim.g.matchup_treesitter_disable_virtual_text = true
      end,
    },
    { 'RRethy/nvim-treesitter-endwise' },
  }
}
