return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>n', '<cmd>Neotree toggle<cr>' },
  },
  config = function ()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true,
        },
      }
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}
