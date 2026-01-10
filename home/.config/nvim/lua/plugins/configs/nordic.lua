return {
  'AlexvZyl/nordic.nvim',
  priority = 10000,
  config = function()
    local U = require('nordic.utils')

    require('nordic').setup({
      on_palette = function() end,
      after_palette = function(palette)
        local diff_blend = 0.6
        palette.diff = {
          change0 = U.blend(palette.blue1, palette.gray0, diff_blend / 2),
          change1 = U.blend(palette.blue2, palette.gray0, diff_blend),
          add = U.blend(palette.green.base, palette.gray0, diff_blend),
          delete = U.blend(palette.red.base, palette.gray0, diff_blend),
        }
      end,
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
