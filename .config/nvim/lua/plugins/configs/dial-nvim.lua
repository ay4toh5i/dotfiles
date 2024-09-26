return {
  'monaqa/dial.nvim',
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal,  -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex,      -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        augend.constant.alias.bool,    -- boolean value (true <-> false)
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
    }

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
