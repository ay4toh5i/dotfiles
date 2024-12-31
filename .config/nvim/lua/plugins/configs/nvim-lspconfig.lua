local ft = {}
ft.deno_files = {
  "deno.json",
  "deno.jsonc",
  "denops",
  "package.json",
}

ft.node_specific_files = {
  "node_modules",
  "bun.lockb",           -- bun
  "package-lock.json",   -- npm or bun
  "npm-shrinkwrap.json", -- npm
  "yarn.lock",           -- yarn
  "pnpm-lock.yaml",      -- pnpm
}

ft.node_files = vim.iter({
      ft.node_specific_files,
      "package.json",
    })
    :flatten(math.huge)
    :totable()

local convertT = {
	denols = "deno",
	vtsls = "tsserver",
}

---@param key string
local function getOptions(key)
	local neoconf = require("neoconf")

	local schemaT = vim.iter({ "", "vscode", "coc", "nlsp" }):map(function(configType)
		return configType == "" and key or ("%s.%s"):format(configType, key)
	end)

	---@type nil|string|table|integer|boolean
	local item = vim.iter(schemaT)
		:map(function(item)
			return neoconf.get(item)
		end)
		:find(function(item)
			return item ~= nil
		end)
end

--@param name string
local function isClientEnable(name)
	name = assert(convertT[name] or name)
	local enable = getOptions(name .. ".enable")
	local disable = getOptions(name .. ".disable")
	if enable == nil and disable == nil then
		return nil
	end

	local isEnable = enable == true or disable == false
	return isEnable
end

---@param path string
local function findRootDirForDeno(path)
  ---@type string|nil
  local project_root =
      vim.fs.root(path, vim.iter({ ".git", ft.deno_files, ft.node_specific_files }):flatten(math.huge):totable())
  project_root = project_root or vim.env.PWD

  local is_node_files_found = vim.iter(ft.node_specific_files):any(function(file)
    return vim.uv.fs_stat(vim.fs.joinpath(project_root, file)) ~= nil
  end)

  -- when node files not found, lauch denols
  if not is_node_files_found then
    local deps_path = vim.fs.joinpath(project_root, "deps.ts")
    if vim.uv.fs_stat(deps_path) ~= nil then
      vim.b[vim.fn.bufnr()].deno_deps_candidate = deps_path
    end
    return project_root
  end

  -- if node files found, check if deno is enabled for this project
  -- check .vscode/settings.json or .neoconf.json for deno.enable and deno.enablePaths
  -- local getOptions = require("neoconf-nvim").getOptions
  local enable = getOptions("deno.enable")
  local enable_paths = getOptions("deno.enablePaths")
  if enable ~= false and type(enable_paths) == "table" then
    local root_in_enable_path = vim.iter(enable_paths)
        :map(function(p)
          return vim.fs.joinpath(project_root, p)
        end)
        :find(function(absEnablePath)
          return vim.startswith(path, absEnablePath)
        end)
    if root_in_enable_path ~= nil then
      local deps_path = vim.fs.joinpath(root_in_enable_path, "deps.ts")
      if vim.uv.fs_stat(deps_path) ~= nil then
        vim.b[vim.fn.bufnr()].deno_deps_candidate = deps_path
      end
      return root_in_enable_path
    end
  end

  -- otherwise, return nil
  return nil
end

return {
  'neovim/nvim-lspconfig',
  event = "VeryLazy",
  config = function()
    require('ddc_source_lsp_setup').setup({})

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

    local lspconfig = require('lspconfig')

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          flags = lsp_flags,
        })
      end,
      denols = function()
        lspconfig["denols"].setup({
          on_attach = function(client, bufnr)
            -- detach denols if vtsls or ts_ls is running. If no buffer is attached to denols, stop the client
            vim.schedule(function()
              ---@type vim.lsp.Client[]
              local nodeLSPs = vim.iter({ "vtsls", "ts_ls" })
                  :map(function(cn)
                    return vim.lsp.get_clients({ name = cn, bufnr = bufnr })
                  end)
                  :flatten()
                  :totable()
              local denoLSPs = vim.lsp.get_clients({ name = "denols", bufnr = bufnr })
              if #nodeLSPs > 0 and #denoLSPs > 0 then
                vim.iter(denoLSPs):each(function(denoLSP)
                  vim.lsp.stop_client(denoLSP.id)
                  if #denoLSP.attached_buffers < 1 then
                    vim.lsp.stop_client(denoLSP.id)
                  end
                end)
              end
            end)

            on_attach(client, bufnr)
          end,
          root_dir = findRootDirForDeno,
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
                  ["https://esm.sh"] = true,
                },
              },
            },
          },
        })
      end,
      ts_ls = function()
        lspconfig["ts_ls"].setup({
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
          end,
          root_dir = function(path)
            ---@param current_path string|nil
            local function find_root(current_path)
              if current_path == nil or current_path == "" then
                return nil
              end

              local project_root =
                  vim.fs.root(current_path, vim.iter({ ".git", ft.node_files }):flatten(math.huge):totable())

              if project_root == nil then
                return nil
              end

              local is_node_files_found = vim.iter(ft.node_specific_files):any(function(file)
                return vim.uv.fs_stat(vim.fs.joinpath(project_root, file)) ~= nil
              end)

              if is_node_files_found then
                return project_root
              end

              if vim.uv.fs_stat(vim.fs.joinpath(project_root, ".git")) ~= nil then
                return nil
              end

              return find_root(vim.fs.dirname(current_path))
            end

            return find_root(path)
          end,
          single_file_support = false,
          flags = lsp_flags,
        })
      end,
    })
  end,
  dependencies = {
    { 'folke/neoconf.nvim' },
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
