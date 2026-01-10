return {
  'goolord/alpha-nvim',
  config = function()
    local config = require('alpha.themes.dashboard').config
    require('alpha').setup(config)
  end,
  dependencies = {
    { 'Shatur/neovim-session-manager' },
  },
};
