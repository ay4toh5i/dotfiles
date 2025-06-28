---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  root_markers = { "go.mod", ".git" },
  init_options = {
    command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" },
  },
}
