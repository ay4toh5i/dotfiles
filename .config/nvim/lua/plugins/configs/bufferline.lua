return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require('bufferline').setup({})
  end,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
