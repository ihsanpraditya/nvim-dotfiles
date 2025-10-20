return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "sindrets/diffview.nvim" },
  { "ledger/vim-ledger" },
  { "godlygeek/tabular" },
  { "RRethy/vim-illuminate" },
  { "tpope/vim-sleuth" }, -- Heuristically set buffer options
  { "mg979/vim-visual-multi", branch = "master" },
  { 
    "lewis6991/gitsigns.nvim",
    event = 'BufReadPre',
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Keybindings
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']h', gs.next_hunk)
        map('n', '[h', gs.prev_hunk)
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', gs.stage_hunk)
        map('v', '<leader>hr', gs.reset_hunk)
      end,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  -- {
  --   "andymass/vim-matchup",
  --   init = function()
  --      vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end
  -- },
  {
    "jiaoshijie/undotree",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<CR>" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {}
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<leader>/",
        block = "<leader>?",
      },
      opleader = {
        line = "<leader>/",
        block = "<leader>?",
      },
    },
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      "ga", -- Default invocation prefix
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    lazy = false,
  },
  {
    'andymass/vim-matchup',
    opts = {
      treesitter = {
        stopline = 500,
      }
    }
  },
}
