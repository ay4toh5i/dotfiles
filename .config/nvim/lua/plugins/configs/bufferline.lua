return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require("bufferline").setup({
      options = {},
    })
  end,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
