return {
  'neovim/nvim-lspconfig',
  event = "VeryLazy",
  config = function()
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
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float,
      { noremap = true, silent = true, desc = "Open diagnostic float" })

    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end,
      { noremap = true, silent = true, desc = "Go to previous diagnostic" })

    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end,
      { noremap = true, silent = true, desc = "Go to next diagnostic" })

    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist,
      { noremap = true, silent = true, desc = "Set loclist" })

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

    vim.lsp.config('*', {
      capabilities = require("ddc_source_lsp").make_client_capabilities(),
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end,
  dependencies = {
    { 'folke/neoconf.nvim' },
    { "mason-org/mason-lspconfig.nvim" },
    { 'Shougo/ddc-source-lsp' },
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
