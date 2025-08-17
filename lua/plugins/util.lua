-- index
-- nvim-tree: file manager
-- dotenv
-- treesitter
-- mason: external tools manager
-- fidget
-- todo-comments
-- data-viewer: CSV, XLS
-- markdown
-- telescope: Ctrl-P
-- dbee: database integration
-- trouble: diagnostics list
-- Alpha: dashboard
-- neominimap
-- laravel.nvim
-- blade-nav.nvim
-- vim-blade
-- conform: formatter engine
-- orgmode
-- pomodoro
-- buffer deletion
return {
  {
    {
      "neovim/nvim-lspconfig",
      event = { "BufNewFile" },
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
      },
      config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
          opts.buffer = bufnr

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I "}
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["astro_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          init_options = {
            typescript = {
              tsdk = '/home/sanArch/.nvm/versions/node/v22.11.0/lib/node_modules/typescript/lib'
            },
          },
        })
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        })
      end,
    },
    "nvim-tree/nvim-tree.lua",
    config = function()
      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end
      require("nvim-tree").setup {
        sort = { sorter = "case_sensitive", },
        view = { relativenumber = true },
        renderer = { group_empty = true, },
        filters = { dotfiles = true, },
        on_attach = my_on_attach                                       -- keymaps in tree view
      }
      vim.keymap.set("n", "<leader>t", ':NvimTreeToggle<CR>')          -- toggle file explorer
      vim.keymap.set("n", "<leader>y", ':NvimTreeFindFileToggle!<CR>') -- toggle file explorer
    end
  },
  {
    "ellisonleao/dotenv.nvim",
    opts = {
      enable_on_load = true,
      verbose = false
    },
    cmd = { "Dotenv" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
          "css",
          "lua",
          "xml",
          "markdown",
        },
      },
      ensure_installed = {
        "bash",
        "markdown",
        "html",
        "css",
        "javascript",
        "tsx",
        "php",
        "query",
        "lua",
        "vim",
      },
      auto_install = false,
      incremental_selection = {
        enable = false
      },
      -- matchup = {
      --   enable = true
      -- }
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      background_colour = "#000000", -- transparent
    }
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  -- Extensible UI for Neovim notifications and LSP progress messages.
  { "j-hui/fidget.nvim",   lazy = true },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'vidocqh/data-viewer.nvim',
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua", -- Optional, sqlite support
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        find_command = "fzf"
      }
    },
    config = function()
      local fzf = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', fzf.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = 'Telescope recent files' })
    end
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    opts = {},
    keys = {
      {
        "<leader>d",
        "<cmd>Dbee<CR>",
        desc = "Open database",
      }
    }
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>Tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>TX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>Ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>Tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>TL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>TQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
      vim.keymap.set('n', '<leader>h', '<cmd>Alpha', { desc = 'Open the home page' })
    end,
  },
  ---@module "neominimap.config.meta"
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false,
    keys = {
      -- Global Minimap Controls
      { "<leader>mm",  "<cmd>Neominimap Toggle<cr>",      desc = "Toggle global minimap" },
      { "<leader>mo",  "<cmd>Neominimap Enable<cr>",      desc = "Enable global minimap" },
      { "<leader>mc",  "<cmd>Neominimap Disable<cr>",     desc = "Disable global minimap" },
      { "<leader>mr",  "<cmd>Neominimap Refresh<cr>",     desc = "Refresh global minimap" },

      -- Window-Specific Minimap Controls
      { "<leader>mwt", "<cmd>Neominimap WinToggle<cr>",   desc = "Toggle minimap for current window" },
      { "<leader>mwr", "<cmd>Neominimap WinRefresh<cr>",  desc = "Refresh minimap for current window" },
      { "<leader>mwo", "<cmd>Neominimap WinEnable<cr>",   desc = "Enable minimap for current window" },
      { "<leader>mwc", "<cmd>Neominimap WinDisable<cr>",  desc = "Disable minimap for current window" },

      -- Tab-Specific Minimap Controls
      { "<leader>mtt", "<cmd>Neominimap TabToggle<cr>",   desc = "Toggle minimap for current tab" },
      { "<leader>mtr", "<cmd>Neominimap TabRefresh<cr>",  desc = "Refresh minimap for current tab" },
      { "<leader>mto", "<cmd>Neominimap TabEnable<cr>",   desc = "Enable minimap for current tab" },
      { "<leader>mtc", "<cmd>Neominimap TabDisable<cr>",  desc = "Disable minimap for current tab" },

      -- Buffer-Specific Minimap Controls
      { "<leader>mbt", "<cmd>Neominimap BufToggle<cr>",   desc = "Toggle minimap for current buffer" },
      { "<leader>mbr", "<cmd>Neominimap BufRefresh<cr>",  desc = "Refresh minimap for current buffer" },
      { "<leader>mbo", "<cmd>Neominimap BufEnable<cr>",   desc = "Enable minimap for current buffer" },
      { "<leader>mbc", "<cmd>Neominimap BufDisable<cr>",  desc = "Disable minimap for current buffer" },

      ---Focus Controls
      { "<leader>mf",  "<cmd>Neominimap Focus<cr>",       desc = "Focus on minimap" },
      { "<leader>mu",  "<cmd>Neominimap Unfocus<cr>",     desc = "Unfocus minimap" },
      { "<leader>ms",  "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
      -- The following options are recommended when layout == "float"
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36 -- Set a large value

      --- Put your configuration here
      -- @type Neominimap.UserConfig
      vim.g.neominimap = {
        auto_enable = false,
      }
    end,
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    opts = {},
    config = true,
  },
  {
    'ricardoramirezr/blade-nav.nvim',
    ft = { 'blade', 'php' }, -- optional, improves startup time
    opts = {
      -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
      close_tag_on_complete = true, -- default: true
    },
  },
  { "jwalton512/vim-blade" },
  {
    'stevearc/conform.nvim', -- Lightweight yet powerful formatter plugin for Neovim
    opts = function ()
      local util = require("conform.util")
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd" },
          typescript = { "prettier" },
          php = { "pint" },
          blade = { "blade-formatter", "rustywind" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          pint = {
            meta = {
              url = "https://github.com/laravel/pint",
              description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
            },
            command = util.find_executable({
              vim.fn.stdpath("data") .. "/mason/bin/pint",
              "vendor/bin/pint",
            }, "pint"),
            args = { "$FILENAME" },
            stdin = false,
          },
        }
      }
      return opts
    end
    ,
  },
  -- {
  --   'nvim-orgmode/orgmode',
  --   event = 'VeryLazy',
  --   ft = { 'org' },
  --   opts = {
  --     org_agenda_files = '~/Documents/mynotes/orgfiles/**/*',
  --     org_default_notes_file = '~/Documents/mynotes/orgfiles/refile.org',
  --     org_adapt_indentation = false,
  --     mappings = {
  --       agenda = {
  --         org_agenda_show_help = 'g?',
  --         org_agenda_later = '>',
  --         org_agenda_earlier = '<',
  --         org_agenda_goto_today = {'.', 'T'}
  --       }
  --     }
  --   }
  -- },
  {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    opts = {
      sessions = {
        pomodoro = {
          { name = "Work",        duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work",        duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work",        duration = "25m" },
          { name = "Long Break",  duration = "15m" },
        }
      }
    },
  },
  {
    "ojroques/nvim-bufdel",
    cmd = "BufDel",
    keys = {
      {
        "<leader>C",
        "<CMD>BufDel<CR>"
      }
    }
  }
  -- { "michaelb/sniprun" },
  -- { "dhruvasagar/vim-table-mode" }
}
