---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  root_markers = { "go.mod", ".git" },
}
