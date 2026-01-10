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
    lintAfterOpen = true,
    languages = {
      markdown = {
        require('efmls-configs.linters.markdownlint'),
        -- require('efmls-configs.linters.textlint'),
        {
          prefix = "textlint",
          lintCommand =
          "deno run -A npm:textlint@latest --no-color --format unix --stdin --stdin-filename ${INPUT}",
          lintStdin = true,
          lintAfterOpen = true,
          lintFormats = {
            [[%E%f:%l:%c: %m \[%t%*[^/]/%r\]],
            [[%E%f:%l:%c: %m]],
            [[%C%m]],
            [[%Z%\d\+ problems]],
            [[%Z%\s%#]],
          },
          rootMarkers = { ".textlintrc", ".textlintrc.json" },
        },
      },
    },
  }
}
