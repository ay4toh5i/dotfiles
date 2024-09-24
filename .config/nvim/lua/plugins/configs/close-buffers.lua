return {
  'kazhala/close-buffers.nvim',
  config = function()
    vim.api.nvim_set_keymap(
      'n',
      '<leader>bdh',
      [[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
      { noremap = true, silent = true }
    )
  end
}
