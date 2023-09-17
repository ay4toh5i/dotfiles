return {
  'Shougo/ddc.vim',
  -- event = { 'InsertEnter' },
  config = function()
    vim.fn['ddc#custom#patch_global']({
      ['ui'] = 'pum',
      ['sources'] = { 'nvim-lsp', 'around', 'buffer' },
      ['sourceOptions'] = {
        ['_'] = {
          matchers = {'matcher_fuzzy'},
          sorters = {'sorter_fuzzy'},
          converters = {'converter_fuzzy'},
        },
        ['around'] = { mark = '[around]' },
        ['buffer'] = { mark = '[buffer]' },
        ['nvim-lsp'] = {
          mark =  '[lsp]',
          dup = 'keep',
          keywordPattern = '\\k+',
          isVolatile = true,
        },
        endfunction
      },
      ['sourceParams'] = {
        ['nvim-lsp'] = {
          snippetEngine = vim.fn["denops#callback#register"](function(body) vim.fn["vsnip#anonymous"](body) end),
          enableResolveItem = true,
          enableAdditionalTextEdit = true,
          confirmBehavior = 'replace',
        },
      },
      ['autoCompleteEvents'] = {'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'},
      ['cmdlineSources'] = {
        [':'] = { 'cmdline', 'cmdline-history', 'arround' },
      }
    })

    vim.cmd[[
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

    vim.fn["popup_preview#enable"]()
    vim.fn["signature_help#enable"]()
    vim.fn["ddc#enable"]()
  end,
  dependencies = {
    { 'vim-denops/denops.vim' },
    { 'Shougo/pum.vim' },
    { 
      'Shougo/ddc-ui-pum', 
      config = function() 
        vim.keymap.set('i', '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>')
        vim.keymap.set('i', '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
        vim.keymap.set('i', '<C-y>', '<Cmd>call pum#map#confirm()<CR>')
        vim.keymap.set('i', '<C-e>', '<Cmd>call pum#map#cancel()<CR>')
        vim.keymap.set('i', '<PageDown>', '<Cmd>call pum#map#insert_relative_page(+1)<CR>')
        vim.keymap.set('i', '<PageUp>', '<Cmd>call pum#map#insert_relative_page(-1)<CR>')

      end
    },
    { 'uga-rosa/ddc-nvim-lsp-setup', config = function() require('ddc_nvim_lsp_setup').setup() end },
    { 'Shougo/ddc-nvim-lsp' },
    { 'tani/ddc-fuzzy' },
    { 'matsui54/denops-signature_help' },
    { 'matsui54/denops-popup-preview.vim' },
    { 'matsui54/ddc-buffer' },
    { 'Shougo/ddc-around' },
    { 'Shougo/ddc-source-cmdline' },
    { 'Shougo/ddc-source-cmdline-history'},
    { 'Shougo/ddc-matcher_head' },
    { 'Shougo/ddc-sorter_rank' },
    { 'hrsh7th/vim-vsnip' },
  },
}

