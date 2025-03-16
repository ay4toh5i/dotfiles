return {
  "coffebar/neovim-project",
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  config = function()
    local result = vim.system({ 'ghq', 'root' }):wait()
    if result.code ~= 0 then
      vim.notify('Failed to get ghq root path', vim.log.levels.ERROR, {
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
      dashboard_mode = true,
    })

    vim.keymap.set('n', '<leader>pj', ':NeovimProjectDiscover<CR>',
      {
        silent = true,
        desc = 'Discover projects',
      }
    )
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    {
      "Shatur/neovim-session-manager",
      config = function()
        require('session_manager').setup({
          autosave_last_session = true,
        })

        local subcommands = require('session_manager.subcommands')
        vim.api.nvim_create_user_command(
          'SessionManager',
          subcommands.run,
          {
            nargs = '*',
            bang = true,
            complete = subcommands.complete,
            desc = 'Run session manager command',
          }
        )

        local sm = require('session_manager')

        -- Auto save session
        vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
          callback = function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              -- Don't save while there's any 'nofile' buffer open.
              if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
                return
              end
            end
            sm.save_current_session()
          end
        })

        vim.keymap.set('n', '<space>sl',
          function()
            if not sm.load_git_session() then
              sm.load_current_dir_session()
            end
          end,
          {
            silent = true,
            desc = 'Load session from git or current directory',
          }
        )
      end,
    },
  },
  lazy = false,
  priority = 100,
}
