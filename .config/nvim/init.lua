require('base')
require('keymaps')
require('plugins')

vim.cmd.colorscheme('nordic')

vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#E0AF68" })         -- Set custom color for directory icon
vim.api.nvim_set_hl(0, "SagaBorder", { link = "FloatBorder" })
