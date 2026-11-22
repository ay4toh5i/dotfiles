return {
  'petertriho/nvim-scrollbar',
  event = "VeryLazy",
  config = function()
    require('scrollbar').setup({
      providers = {
        gitsigns = true,
      },
    })
  end,
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
}
