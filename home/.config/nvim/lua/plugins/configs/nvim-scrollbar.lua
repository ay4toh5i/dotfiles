return {
  'petertriho/nvim-scrollbar',
  branch = 'v1',
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
