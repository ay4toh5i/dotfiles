return {
  'AlexvZyl/nordic.nvim',
  priority = 10000,
  config = function()
    local palette = require('nordic.colors')

    require('nordic').setup(
      {
        override = {
          Visual = { bg = palette.gray1 }
        }
      }
    )
  end
}