return {
  'akinsho/bufferline.nvim',
  version = '*',
  after = 'catppuccin',
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get()
    })
  end,
  dependencies = 'nvim-tree/nvim-web-devicons',
}
