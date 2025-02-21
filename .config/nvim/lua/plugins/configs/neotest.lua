return {
  "nvim-neotest/neotest",
  config = function()
    require("neotest").setup({
      discovery = {
        enabled = false,
        concurrent = 3,
      },
      adapters = {
        require("neotest-golang")({
          runner = "gotestsum",
        }),
        require("neotest-vitest"),
        require("neotest-jest"),
        require("neotest-rust"),
        require("neotest-vim-test")({
          ignore_file_types = { "rust", "go", "ts", "js" },
        }),
      },
    })
  end,
  keys = {
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run the nearest test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run the current file test",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle the test summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open()
      end,
      desc = "Toggle the test output",
    }
  },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-vim-test",
    { "fredrikaverpil/neotest-golang", version = "*" },
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
    "rouge8/neotest-rust",
  }
}
