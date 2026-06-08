return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim' },
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'buf_ls',
        'cssls',
        'efm',
        'eslint',
        'denols',
        'dockerls',
        'gopls',
        'golangci_lint_ls',
        'html',
        'nil_ls',
        'jsonls',
        'lua_ls',
        'rust_analyzer',
        'typos_lsp',
        'terraformls',
        'ts_ls',
        'yamlls',
      },
      automatic_enable = {
        exclude = { 'vtsls' },
      },
      automatic_installation = false,
    })
  end
}
