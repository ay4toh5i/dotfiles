return {
  'monaqa/dial.nvim',
  config = function()
    local dial = require("dial.map")
    vim.keymap.set("n", "<C-a>", function() dial.manipulate("increment", "normal") end)
    vim.keymap.set("n", "<C-x>", function() dial.manipulate("decrement", "normal") end)
    vim.keymap.set("n", "g<C-a>", function() dial.manipulate("increment", "gnormal") end)
    vim.keymap.set("n", "g<C-x>", function() dial.manipulate("decrement", "gnormal") end)
    vim.keymap.set("v", "<C-a>", function() dial.manipulate("increment", "visual") end)
    vim.keymap.set("v", "<C-x>", function() dial.manipulate("decrement", "visual") end)
    vim.keymap.set("v", "g<C-a>", function() dial.manipulate("increment", "gvisual") end)
    vim.keymap.set("v", "g<C-x>", function() dial.manipulate("decrement", "gvisual") end)
  end
}
