local icons = {
  copilot = '',
  denols = '',
  ts_ls = '',
  gopls = '',
  rust_analyzer = '',
  lua_ls = '',
}

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lsp_names = function()
      local clients = vim
          .iter(vim.lsp.get_clients { bufnr = 0 })
          :map(function(client)
            if client.name == 'null-ls' then
              return ('null-ls(%s)'):format(table.concat(
                vim
                .iter(require('null-ls.sources').get_available(vim.bo.filetype))
                :map(function(source)
                  return source.name
                end)
                :totable(),
                ', '
              ))
            else
              return icons[client.name] or client.name
            end
          end)
          :totable()

      return ' ' .. table.concat(clients, ', ')
    end

    require('lualine').setup({
      options = {
        theme = 'nordic',
        globalstatus = true,
      },
      extensions = { 'neo-tree' },
      sections = {
        lualine_x = { lsp_names },
      },
    })

    local opts = require('lualine').get_config()
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
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })
  end,
}
