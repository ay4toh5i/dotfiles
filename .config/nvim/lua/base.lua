vim.o.laststatus = 3  -- Global Status Line
vim.o.showcmd = true  -- default
vim.o.showmode = false
vim.o.autoread = true -- default
vim.o.backup = false
vim.o.hidden = true   -- default
vim.o.mouse = 'a'     -- default: nvi
vim.o.clipboard = 'unnamed'
vim.o.virtualedit = 'onemore'
vim.o.visualbell = true
vim.o.showmatch = true
vim.o.wildmode = 'list:longest'

-- :set list → show hidden characters
-- :set nolist → hide hidden characters
vim.o.list = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorlineopt = 'both'
vim.wo.cursorcolumn = false
vim.wo.signcolumn = 'yes'

vim.opt.fenc = 'UTF-8'
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.syntax = 'ON'
vim.opt.modifiable = true
vim.opt.fillchars:append({ eob = " " })

vim.opt.splitright = true
vim.opt.splitbelow = true

-- filetype plugin indent true
-- See https://qiita.com/delphinus/items/a202d0724a388f6cdbc3
vim.opt.termguicolors = true
vim.opt.pumblend = 5
vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.expandtab = false
  end
})
