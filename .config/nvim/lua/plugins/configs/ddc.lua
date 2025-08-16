return {
  'Shougo/ddc.vim',
  -- event = { 'InsertEnter' },
  config = function()
    vim.fn['ddc#custom#patch_global']({
      ['ui'] = 'pum',
      ['autoCompleteEvents'] = { 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged' },
      ['backspaceCompletion'] = true,
      ['cmdlineSources'] = {
        [':'] = { 'cmdline', 'cmdline_history', 'around' },
      },
      ['sources'] = { 'lsp', 'around', 'buffer' },
      ['sourceOptions'] = {
        ['_'] = {
          ignoreCase = true,
          matchers = { 'matcher_fuzzy' },
          sorters = { 'sorter_fuzzy' },
          converters = { 'converter_fuzzy' },
        },
        ['around'] = { mark = '[around]' },
        ['buffer'] = { mark = '[buffer]' },
        ['lsp'] = {
          mark = '[lsp]',
          dup = 'keep',
          sorters = { 'sorter_fuzzy', 'sorter_lsp-kind' },
          converters = { 'converter_fuzzy', 'converter_kind_labels' },
          forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
          minAutoCompleteLength = 1,
          isVolatile = true,
        },
      },
      ['sourceParams'] = {
        ['lsp'] = {
          snippetEngine = vim.fn['denops#callback#register'](function(body) vim.fn['vsnip#anonymous'](body) end),
          enableResolveItem = true,
          enableAdditionalTextEdit = true,
          confirmBehavior = 'replace',
        },
      },
      ['filterParams'] = {
        ['converter_kind_labels'] = {
          kindLabels = {
            Text = ' ',
            Method = '',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = ''
          },
          kindHlGroups = {
            Method = 'Function',
            Function = 'Function',
            Constructor = 'Function',
            Field = 'Identifier',
            Variable = 'Identifier',
            Class = 'Structure',
            Interface = 'Structure'
          },
        }
      }
    })

    vim.fn['popup_preview#enable']()
    vim.fn['signature_help#enable']()
    vim.fn['ddc#enable']()
  end,
  dependencies = {
    { 'vim-denops/denops.vim' },
    { 'Shougo/pum.vim' },
    {
      'Shougo/ddc-ui-pum',
      config = function()
        vim.api.nvim_create_autocmd('ColorScheme', {
          pattern = '*',
          callback = function()
            vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'None', fg = 'None' })
          end,
        })

        vim.fn['pum#set_option']({
          border = 'rounded',
          padding = false,
          scrollbar_char = '┃',
          item_orders = { 'kind', 'space', 'abbr', 'space', 'menu' },
          offset_cmdrow = -2,
          max_height = 15,
          blend = 0, -- for transparent background, any other value will make the pum background black
        })

        vim.cmd [[
          nnoremap :       <Cmd>call CommandlinePre()<CR>:

          function! CommandlinePre() abort
            cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
            cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
            cnoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
            cnoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
            cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
            cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

            autocmd User DDCCmdlineLeave ++once call CommandlinePost()

            " Enable command line completion for the buffer
            call ddc#enable_cmdline_completion()
          endfunction

          function! CommandlinePost() abort
            silent! cunmap <Tab>
            silent! cunmap <S-Tab>
            silent! cunmap <C-n>
            silent! cunmap <C-p>
            silent! cunmap <C-y>
            silent! cunmap <C-e>
          endfunction
        ]]

        vim.keymap.set('i', '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>')
        vim.keymap.set('i', '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
        vim.keymap.set('i', '<C-y>', '<Cmd>call pum#map#confirm()<CR>')
        vim.keymap.set('i', '<C-e>', '<Cmd>call pum#map#cancel()<CR>')
        vim.keymap.set('i', '<PageDown>', '<Cmd>call pum#map#insert_relative_page(+1)<CR>')
        vim.keymap.set('i', '<PageUp>', '<Cmd>call pum#map#insert_relative_page(-1)<CR>')
      end
    },
    { 'Shougo/ddc-nvim-lsp' },
    { 'tani/ddc-fuzzy' },
    { 'matsui54/denops-signature_help' },
    {
      'matsui54/denops-popup-preview.vim',
      setup = function()
        vim.g.popup_preview_config = {
          border = 'rounded',
          winblend = 30,
        }
      end,
    },
    { 'matsui54/ddc-buffer' },
    { 'Shougo/ddc-source-around' },
    { 'Shougo/ddc-source-cmdline' },
    { 'Shougo/ddc-source-cmdline_history' },
    { 'Shougo/ddc-matcher_head' },
    { 'Shougo/ddc-sorter_rank' },
    { 'hrsh7th/vim-vsnip' },
  },
}
