return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      panel = {
        layout = {
          position = 'right',
        },
      },
      suggestion = {
        auto_trigger = true,
      },
    })
  end
}
