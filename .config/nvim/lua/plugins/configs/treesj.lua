return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
  keys = {
    {
      '<leader>m',
      function()
        require('treesj').toggle()
      end,
      desc = 'Toggle the spliting/joining blocks of code like array, object, etc',
    },
    {
      '<leader>M',
      function()
        require('treesj').toggle({ split = { recursive = true } })
      end,
      desc = 'Toggle the spliting/joining blocks of code recursively',
    }
  },
}
