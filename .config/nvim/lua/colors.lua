vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    local palette = require('nordic.colors')

    vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#E0AF68" }) -- Set custom color for directory icon

    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'None', fg = 'None' })

    -- nvimdev/lspsaga.nvim
    vim.api.nvim_set_hl(0, "SagaBorder", { link = "FloatBorder" })

    -- RRethy/vim-illuminate
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = palette.gray2, bold = true })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = palette.gray2, bold = true })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = palette.gray2, bold = true })
  end,
})
