return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = ' ',
        button = { ' ', ' ' },
      },
      code_action = {
        show_server_name = true,
      },
      lightbulb = {
        virtual_text = false,
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
}
