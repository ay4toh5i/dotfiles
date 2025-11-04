---@type vim.lsp.Config
return {
  single_file_support = true,
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      completeFunctionCalls = true,
      names = true,
      paths = true,
      autoImports = true,
      imports = {
        autoDiscover = true,
        hosts = vim.empty_dict(),
      },
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enable = true },
        enumMemberValues = { enabled = true },
      },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enable = true },
        enumMemberValues = { enabled = true },
      },
    }
  },
  workspace_required = false,
}
