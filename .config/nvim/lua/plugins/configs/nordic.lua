return {
  'AlexvZyl/nordic.nvim',
  priority = 10000,
  config = function()
    require('nordic').setup({
      on_palette = function() end,
      after_palette = function () end,
      on_highlight = function(highlights, palette)
        highlights.Visual = { bg = palette.gray2 }
        highlights.PmenuSel = { bg = palette.gray2 }
      end,
      bold_keywords = true,
      transparent = {
        bg = true,
        float = true,
      },
      telescope = {
        style = 'classic',
      }
    })
  end
}
