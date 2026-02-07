return {
  "keaising/im-select.nvim", -- https://github.com/keaising/im-select.nvim
  -- dependencies(MacOS)
  -- brew tap laishulu/homebrew
  -- brew install macism
  -- or build from source
  -- git clone https://github.com/laishulu/macism
  -- cd macism
  -- make
  -- cp macism ~/.local/bin/
  config = function()
    require("im_select").setup({})
  end,
}
