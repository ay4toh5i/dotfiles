return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require('notify')
    notify.setup({
      background_colour = '#1e222a',
      merge_duplicates = true,
    })
    vim.notify = notify
  end,
}
