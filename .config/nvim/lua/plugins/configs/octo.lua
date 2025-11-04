return {
  'pwntester/octo.nvim',
  config = function()
    require("octo").setup()
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
}
