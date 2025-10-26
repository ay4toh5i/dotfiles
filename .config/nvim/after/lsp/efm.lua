---@type vim.lsp.Config
return {
  cmd = { "efm-langserver" },
  filetypes = { "markdown" },
  single_file_support = true,
  init_options = {
    documentFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      markdown = {
        require('efmls-configs.linters.markdownlint'),
        require('efmls-configs.linters.textlint'),
      },
    },
  }
}
