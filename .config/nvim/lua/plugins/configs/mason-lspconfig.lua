return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim' },
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'denols',
        'vtsls',
        'gopls',
        'golangci_lint_ls',
        'rust_analyzer',
        'html',
        'cssls',
        'dockerls',
        'buf_ls',
        'jsonls',
        'yamlls',
        'typos_lsp',
      },
      automatic_enable = true,
      automatic_installation = false,
    })
  end
}
