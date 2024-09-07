return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = { 
        theme = 'nordic',
        globalstatus = true,
      },
      extensions = { 'neo-tree' },
    })
  end,
}
