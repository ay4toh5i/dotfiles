return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = function()
    local actions = require('telescope.actions')
    local egrep_actions = require("telescope._extensions.egrepify.actions")

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-h>'] = "which_key",
          },
        },
        file_ignore_patterns = {
          "^.git/",
          "^.cache/",
          "node_modules",
          "cdk.out",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        egrepify = {
          -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
          -- if str1 and str2 are consecutively in line with anything in between (wildcard)
          AND = true,                   -- default
          permutations = false,         -- opt-in to imply AND & match all permutations of prompt tokens
          lnum = true,                  -- default, not required
          lnum_hl = "EgrepifyLnum",     -- default, not required, links to `Constant`
          col = false,                  -- default, not required
          col_hl = "EgrepifyCol",       -- default, not required, links to `Constant`
          title = true,                 -- default, not required, show filename as title rather than inline
          filename_hl = "EgrepifyFile", -- default, not required, links to `Title`
          results_ts_hl = false,        -- set to true if you want results ts highlighting, may increase latency!
          -- suffix = long line, see screenshot
          -- EXAMPLE ON HOW TO ADD PREFIX!
          prefixes = {
            -- ADDED ! to invert matches
            -- example prompt: ! sorter
            -- matches all lines that do not comprise sorter
            -- rg --invert-match -- sorter
            ["!"] = {
              flag = "invert-match",
            },
            -- HOW TO OPT OUT OF PREFIX
            -- ^ is not a default prefix and safe example
            ["^"] = false
          },
          -- default mappings
          mappings = {
            i = {
              -- toggle prefixes, prefixes is default
              ["<C-z>"] = egrep_actions.toggle_prefixes,
              -- toggle AND, AND is default, AND matches tokens and any chars in between
              ["<C-a>"] = egrep_actions.toggle_and,
              -- toggle permutations, permutations of tokens is opt-in
              ["<C-r>"] = egrep_actions.toggle_permutations,
            },
          },
        },
      },
    })

    require('telescope').load_extension('fzf')
    require("telescope").load_extension("egrepify")
  end,
  keys = {
    { "<leader>ff", ":Telescope find_files hidden=true<CR>" },
    { "<leader>fg", ":Telescope egrepify<CR>" },
    { "<leader>fb", ":Telescope buffers<CR>" },
    { "<leader>of", ":Telescope oldfiles<CR>" },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }
}
