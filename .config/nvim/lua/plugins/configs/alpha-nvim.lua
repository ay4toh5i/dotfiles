return {
  'goolord/alpha-nvim',
  config = function()
    local config = require('alpha.themes.dashboard').config
    require('alpha').setup(config)
  end,
  dependencies = {
    {
      'Shatur/neovim-session-manager',
      config = function()
        local config = require('session_manager.config')

        require('session_manager').setup({
          autoload_mode = config.AutoloadMode.Disabled,
        })

        vim.keymap.set('n', '<space>sl', '<cmd>SessionManager load_last_session<CR>', { silent = true })
      end,
    },
  },
};
