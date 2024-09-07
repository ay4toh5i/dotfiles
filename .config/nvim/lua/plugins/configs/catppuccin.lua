return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      integrations = {
        neotree = true,
      },
    })
  end,
  priority = 1000,
  enabled = false,
}
