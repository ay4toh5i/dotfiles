vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#E0AF68" }) -- Set custom color for directory icon

    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'None', fg = 'None' })
    vim.api.nvim_set_hl(0, "SagaBorder", { link = "FloatBorder" })
  end,
})
