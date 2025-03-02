return {
  'AlexvZyl/nordic.nvim',
  priority = 10000,
  config = function()
    require('nordic').setup({
      on_highlight = function(highlights, palette)
        highlights.Visual = { bg = palette.gray2 }
        highlights.PmenuSel = { bg = palette.gray2 }
        highlights.TelescopeMatching = { fg = palette.orange.base, bold = true }
      end,
      bold_keywords = true,
      transparent = {
        bg = true,
        float = true,
      },
    })
  end
}
