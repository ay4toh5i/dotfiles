-- See: https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    if fname ~= '' and vim.fn.findfile('package.json', fname .. ';') ~= '' then
      on_dir(vim.fs.root(bufnr, { 'package.json', 'tsconfig.json', 'jsconfig.json' }) or vim.fn.getcwd())
    end
  end,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      },
    },
  },
  single_file_support = false,
  workspace_required = true,
}
