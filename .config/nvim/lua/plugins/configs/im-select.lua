return {
  "keaising/im-select.nvim", -- https://github.com/keaising/im-select.nvim
  -- dependencies(MacOS)
  -- brew tap laishulu/homebrew
  -- brew install macism
  config = function()
    require("im_select").setup({})
  end,
}
