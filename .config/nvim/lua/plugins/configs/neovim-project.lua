return {
  "coffebar/neovim-project",
  config = function()
    local config = require('session_manager.config')

    local result = vim.system({ 'ghq', 'root' }):wait()
    if result.code ~= 0 then
      vim.notify('Failed to get ghq root path', 'error', {
        title = 'Neovim Project',
      })
    end

    local ghq_root = vim.trim(result.stdout)

    require('neovim-project').setup({
      projects = { -- define project roots
        '~/dotfiles',
        ghq_root .. '/github.com/*/*',
      },
      picker = {
        type = "telescope", -- or "fzf-lua"
      },
      last_session_on_startup = false,
      session_manager_opts = {
        autoload_mode = config.AutoloadMode.Disabled,
      },
    })

    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.

    local subcommands = require('session_manager.subcommands')
    vim.api.nvim_create_user_command('SessionManager', subcommands.run,
      { nargs = '*', bang = true, complete = subcommands.complete, desc = 'Run session manager command' })

    vim.keymap.set('n', '<space>sl', ':SessionManager load_current_dir_session<CR>', { silent = true })
    vim.keymap.set('n', '<leader>pj', ':NeovimProjectDiscover<CR>', { silent = true })
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
