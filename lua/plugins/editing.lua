return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "lewis6991/gitsigns.nvim" },
  { "sindrets/diffview.nvim" },
  { "ledger/vim-ledger" },
  { "godlygeek/tabular" },
  { "RRethy/vim-illuminate" },
  { "tpope/vim-sleuth" }, -- Heuristically set buffer options
  { "mg979/vim-visual-multi", branch = "master" },
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
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",                -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp", -- install jsregexp (optional!).
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("blade", {"html", "php"})
      require("luasnip").filetype_extend("vue", {"html"})

      vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
      -- CUSTOM SNIPPETS
      ls.add_snippets("all", {
        s("hor", {
          t("your snippet engine works correctly!")
        })
})
    end
  },
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
}
