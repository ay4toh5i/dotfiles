return {
  'neovim/nvim-lspconfig',
  event = "VeryLazy",
  config = function()
    require('ddc_source_lsp_setup').setup()

    vim.diagnostic.config({
      virtual_text = {
        prefix = "󰧞",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    })

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local trouble = require('trouble')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
        { desc = 'declaration', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', 'gd', function() trouble.toggle('lsp_definitions') end,
        { desc = 'definition', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'hover', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', 'gi', function() trouble.toggle('lsp_implementations') end,
        { desc = 'implementations', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
        { desc = 'signature', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
        { desc = 'add workspace folder', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
        { desc = 'remove workspace folder', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        { desc = 'list workspace', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>D', function() trouble.toggle('lsp_type_definitions') end,
        { desc = 'type definition', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,
        { desc = 'rename', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>ca', ':Lspsaga code_action<CR>',
        { desc = 'code action', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', 'gr', function() trouble.toggle({ mode = 'lsp_references', focus = true }) end,
        { desc = 'references', noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set('n', '<space>fm', vim.lsp.buf.format,
        { desc = 'code format', noremap = true, silent = true, buffer = bufnr })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded", -- "shadow" , "none", "rounded"
        }
      )
    end

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler (optional)
        local lspconfig = require('lspconfig')

        local is_node_dir = function()
          return lspconfig.util.root_pattern('package.json')(vim.fn.getcwd())
        end

        if server_name == 'denols' then
          lspconfig[server_name].setup {
            on_attach = function(client, bufnr)
              if is_node_dir() then
                client.stop(true)
              end

              on_attach(client, bufnr)
            end,
            single_file_support = true,
            flags = lsp_flags,
            init_options = {
              lint = true,
              unstable = true,
              suggest = {
                imports = {
                  hosts = {
                    ["https://deno.land"] = true,
                    ["https://cdn.nest.land"] = true,
                    ["https://crux.land"] = true,
                  },
                },
              },
            },
          }
        elseif server_name == 'ts_ls' then
          lspconfig[server_name].setup {
            on_attach = function(client, bufnr)
              if not is_node_dir() then
                client.stop(true)
              end

              on_attach(client, bufnr)
            end,
            single_file_support = false,
            flags = lsp_flags,
          }
        else
          lspconfig[server_name].setup {
            on_attach = on_attach,
            flags = lsp_flags,
          }
        end
      end,
    }
  end,
  dependencies = {
    { 'Shougo/ddc-source-lsp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/trouble.nvim' },
    {
      'onsails/lspkind.nvim',
      config = function()
        require('lspkind').init({
          -- DEPRECATED (use mode instead): enables text annotations
          --
          -- default: true
          -- with_text = true,

          -- defines how annotations are shown
          -- default: symbol
          -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
          mode = 'symbol_text',

          -- default symbol map
          -- can be either 'default' (requires nerd-fonts font) or
          -- 'codicons' for codicon preset (requires vscode-codicons font)
          --
          -- default: 'default'
          preset = 'codicons',

          -- override preset symbols
          --
          -- default: {}
          symbol_map = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          },
        })
      end
    }
  },
}
