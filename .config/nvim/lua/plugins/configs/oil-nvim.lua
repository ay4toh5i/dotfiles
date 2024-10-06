return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require("oil").setup({
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        win_options = {
          winblend = 5,
        },
      }
    })

    local oil = require("oil")
    vim.keymap.set('n', '<leader>o', function() oil.toggle_float() end)
  end,
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
