local icons = {
  copilot = '',
  denols = '',
  ts_ls = '',
  gopls = '',
  rust_analyzer = '',
  lua_ls = '',
}

local lsp_names = function()
  local clients = vim
      .iter(vim.lsp.get_clients { bufnr = 0 })
      :map(function(client)
        return icons[client.name] or client.name
      end)
      :totable()

  return ' ' .. table.concat(clients, ', ')
end

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })

    local lsp_symbols = { symbols.get, cond = symbols.has }

    require('lualine').setup({
      options = {
        theme = 'nordic',
        globalstatus = true,
      },
      extensions = { 'neo-tree' },
      sections = {
        lualine_c = { 'filename', lsp_symbols },
        lualine_x = { 'overseer', lsp_names, 'encoding', 'filetype' },
      },
    })
  end,
}
