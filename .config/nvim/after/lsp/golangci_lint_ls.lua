---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  root_markers = { "go.mod", ".git" },
  init_options = {
    -- command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" },
  },
}
