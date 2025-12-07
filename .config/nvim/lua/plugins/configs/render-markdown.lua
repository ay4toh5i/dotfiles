return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown", "copilot-chat", "Avante" },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { 'markdown', 'mdx', 'copilot-chat', 'Avante' },
    code = {
      width = "block",
    },
    overrides = {
      buftype = {
        nofile = {
          anti_conceal = { enabled = false },
          win_options = {
            concealcursor = {
              rendered = 'nvic',
            },
          },
        },
      },
    },
  },
}
