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
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
      { noremap = true, silent = true, desc = "Go to previous diagnostic" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
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

    local lspconfig = require('lspconfig')

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'denols',
        'vtsls',
        'gopls',
        'golangci_lint_ls',
        'rust_analyzer',
        'typos_lsp',
        'buf_ls',
      },
      automatic_enable = true,
      automatic_installation = false,
    })

    vim.lsp.config('*', {
      capabilities = require("ddc_source_lsp").make_client_capabilities(),
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    })

    vim.lsp.config('golganci_lint_ls', {
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      init_options = {
        command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" },
      },
    })

    local on_lsp_attach = function(callback)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          callback(client, buffer)
        end,
      })
    end

    -- detach denols if vtsls or tsserver is running. If no buffer is attached to denols, stop the client
   on_lsp_attach(function(client, bufnr)
      local node_servers = { "vtsls", "tsserver", "ts_ls" }

      if not vim.iter({ node_servers, "denols" }):flatten(math.huge):any(function(s)
            return client.name == s
          end) then
        return
      end

      vim.schedule(function()
        ---@type vim.lsp.Client[]
        local nodeLSPs = vim.iter({ "vtsls", "tsserver", "ts_ls" })
            :map(function(cn)
              return vim.lsp.get_clients({ name = cn, bufnr = bufnr })
            end)
            :flatten()
            :totable()
        local denoLSPs = vim.lsp.get_clients({ name = "denols", bufnr = bufnr })
        if #nodeLSPs > 0 and #denoLSPs > 0 then
          vim.iter(denoLSPs):each(function(denoLSP)
            vim.lsp.buf_detach_client(bufnr, denoLSP.id)
          end)
        end
      end)
    end)

    vim.lsp.config('denols', {
      single_file_support = true,
      init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true,
              ["https://esm.sh"] = true,
            },
          },
        },
      },
      workspace_required = false,
    })

    vim.lsp.config('vtls', {
      single_file_support = false,
      root_markers = {
        'package.json',
      },
      workspace_required = true,
    })
  end,
  dependencies = {
    { 'folke/neoconf.nvim' },
    { 'Shougo/ddc-source-lsp' },
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
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
