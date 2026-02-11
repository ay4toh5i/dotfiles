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
        exclude = { 'denols', 'vtsls', 'ts_ls' },
      },
      automatic_installation = false,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("LspStartNodeOrDeno", { clear = true }),
      callback = function(ctx)
        if not vim.tbl_contains(
              {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
              },
              ctx.match
            ) then
          return
        end

        -- node
        if vim.fn.findfile("package.json", ".;") ~= "" then
          vim.lsp.start(vim.lsp.config.ts_ls)
          return
        end

        -- deno
        vim.lsp.start(vim.lsp.config.denols)
      end,
    })
  end
}
