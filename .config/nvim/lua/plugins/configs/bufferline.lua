return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slant",
      }
    })
  end,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
