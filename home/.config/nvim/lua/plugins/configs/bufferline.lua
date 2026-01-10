return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require("bufferline").setup({
      options = {
        indicator = { icon = ' ' },
        separator_style = { '', '' },
      },
    })
  end,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
