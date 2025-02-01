return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken",                          -- Only on MacOS or Linux
  config = function()
    require("CopilotChat").setup({
      window = {
        width = 0.25,
      },
      prompts = {
        Explain = {
          prompt = "> /COPILOT_EXPLAIN コードを日本語で説明してください",
          description = "コードの説明をお願いする",
        },
        Review = {
          prompt = '> /COPILOT_REVIEW コードを日本語でレビューしてください。',
          description = "コードのレビューをお願いする",
        },
        Fix = {
          prompt = "> /COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
          description = "コードの修正をお願いする",
        },
        Optimize = {
          prompt = "> /COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
          description = "コードの最適化をお願いする",
        },
        Docs = {
          prompt = "> /COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
          description = "コードのドキュメント作成をお願いする",
        },
        Tests = {
          prompt = "> /COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
          description = "テストコード作成をお願いする",
        },
        FixDiagnostic = {
          prompt = '> コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
          description = "コードの修正をお願いする",
        },
        Commit = {
          prompt =
          '> #git:staged ステージ済みの変更に対するコミットメッセージを英語で記述してください。',
          description = "コミットメッセージの作成をお願いする",
        },
      },
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'copilot-*',
      callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.cursorcolumn = false

        -- C-p to print last response
        vim.keymap.set('n', '<C-p>', function()
          print(require("CopilotChat").response())
        end, { buffer = true, remap = true })
      end
    })
  end,
  -- See Commands section for default commands if you want to lazy load on them
  keys = {
    { "<leader>cpp", "<cmd>CopilotChatToggle<CR>", desc = 'CopilotChat - Toggle' },
    {
      "<leader>cpa",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      mode = { "n", "v" },
      desc = "CopilotChat - Prompt actions",
    },
    {
      "<leader>cpq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      mode = { "n", "v" },
      desc = "CopilotChat - Quick chat",
    },
  }
}
