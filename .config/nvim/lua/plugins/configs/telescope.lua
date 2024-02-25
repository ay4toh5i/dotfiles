return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
      mappings = {
        i = {
          ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
        file_ignore_patterns = {
          "^.git/",
          "^.cache/",
          "^node_modules/",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "-uu",
        },
      },
    })
  end,
  keys = {
    { "<leader>ff", ":Telescope find_files hidden=true<CR>" },
    { "<leader>fg", ":Telescope live_grep<CR>" },
    { "<leader>of", ":Telescope oldfiles<CR>" },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
}
