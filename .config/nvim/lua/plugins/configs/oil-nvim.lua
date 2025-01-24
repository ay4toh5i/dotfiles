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
        max_width = 140,
        win_options = {
          winblend = 0, -- for transparent background
        },
      }
    })

    local oil = require("oil")
    vim.keymap.set('n', '<leader>oo', function() oil.toggle_float() end)
  end,
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
