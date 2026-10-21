return {
  'petertriho/nvim-scrollbar',
  event = "VeryLazy",
  config = function()
    require('scrollbar').setup({
      handlers = {
        gitsigns = true,
      }
    })
  end,
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
}
