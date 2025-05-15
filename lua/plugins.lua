-- plugin with 'require' option also installs its requirement
-- so you don't have to type it anymore
-- WARNING need to migrate to lazy.nvim
---------- INDEX ----------
-- app features
--  plenary
--  fzf (fuzzy finder)
--  dotenv integration
--  nvim-dap: Debug Adapter Protocol client
--  nvim-tree file manager
--  notify
--  todo magic comment
--  Trouble: for diagnotisc
--  data-viewer for CSV,TSV
--  sqlua SQL integration
--  neominimap
--  dashboard-nvim
-- appearance
--  devicons
--  bufferline
--  lualine
--  colorschemes
--    rose-pine
--    dracula
--    nightfox
--    tokyonight
--    oxocarbon
--    midnight
-- editing
--  vim-fugitive Git integration
--  gitsigns Git integration for buffers
--  diffview simplifying Git diff split
--  indent
--  visual-multi
--  nvim-polyglot (Syntax)
--  nvim-comment
--  undotree
--  which-key
--  ledger highlighting
--  tabular (align)
--  illuminate (highlight same word)
--  text-case
--  nvim-surround
--  nvim-autopairs
--  luasnip
--
-- .local/share/nvim/site/pack/packer/
--       start for internal setup
--       opt for external setup
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer manage itself
    use 'wbthomason/packer.nvim'

    -- APP FEATURES
    use "nvim-lua/plenary.nvim"
    --  provides a collection of useful functions
    --  and utilities to simplify plugin development.
    use 'ibhagwan/fzf-lua' -- NOTE planning to use Telescope
    use 'ellisonleao/dotenv.nvim'
    -- use 'mfussenegger/nvim-dap'
    use 'nvim-tree/nvim-tree.lua'
    use 'rcarriga/nvim-notify'     -- TODO use it
    use 'folke/todo-comments.nvim' -- require plenary, need Telescope for better use
    -- use {
    --     'folke/trouble.nvim',
    --     cmd = 'Trouble'
    -- }
    use 'VidocqH/data-viewer.nvim' -- require plenary FIX
    use {
        'xemptuous/sqlua.nvim',
        cmd = 'SQLua',
        opt = true,
        config = function()
            require('sqlua').setup()
        end
    }
    use {
        'Isrothy/neominimap.nvim',
        config = function()
            vim.g.neominimap_enabled = false
            vim.keymap.set('n', '<leader>m', ':Neominimap Toggle<CR>')
        end
    }
    use {
        'nvimdev/dashboard-nvim', -- requires nviw-web-devicons
        event = 'VimEnter',
        config = function()
            require("dashboard").setup {
                theme = "hyper",
                config = {
                    packages = { enable = false },
                    project = { enable = true, limit = 8, icon = '', label = '', action = 'FzfLua files' },
                }
            }
        end
    }

    -- APPEARANCE
    use 'nvim-tree/nvim-web-devicons' -- required by many packages
    use 'akinsho/bufferline.nvim'     -- requires nvim-web-devicons
    use 'nvim-lualine/lualine.nvim'   -- status bar or use romgrk/barbar.nvim
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'Mofiqul/dracula.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'folke/tokyonight.nvim'
    use 'nyoom-engineering/oxocarbon.nvim'
    use 'dasupradyumna/midnight.nvim'

    -- EDITING
    use "tpope/vim-fugitive"                  -- Git Support for Neovim
    use "lewis6991/gitsigns.nvim"             -- Git integration for buffers
    use "sindrets/diffview.nvim"              -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    use 'lukas-reineke/indent-blankline.nvim' -- indent line
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'sheerun/vim-polyglot'
    use 'terrortylor/nvim-comment'
    use 'mbbill/undotree' -- Undo History Menu and increase it
    -- use 'folke/which-key.nvim' -- popup for available key
    use 'ledger/vim-ledger'
    use 'godlygeek/tabular'
    use 'RRethy/vim-illuminate'                          -- underline/highlight same word
    use { 'johmsalas/text-case.nvim', cmd = { 'Subs' } } -- FIX
    -- An all in one plugin for converting text case in Neovim
    -- need Telescope
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    }
    use {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        -- run = "make install_jsregexp" -- optional
        requires = {
            "rafamadriz/friendly-snippets",
            "molleweide/LuaSnip-snippets.nvim",
        },
    }

    -- lsp-zero help you integrate nvim-cmp (an autocompletion plugin) and nvim-lspconfig
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     requires = {
    --         {'williamboman/mason.nvim'}, -- Portable package manager
    --         {'williamboman/mason-lspconfig.nvim'}, -- Extension to the package manager
    --         {'neovim/nvim-lspconfig'}, -- Quickstart configs for Nvim LSP
    --         {'hrsh7th/cmp-nvim-lsp'}, -- nvim-cmp source for neovim builtin LSP client
    --         {'hrsh7th/nvim-cmp'}, -- completion engine plugin
    --         {'L3MON4D3/LuaSnip'}, -- Snippet Engine
    --     },
    -- }
    -- use 'mfussenegger/nvim-lint'
    -- --[[
    -- use 'nvim-orgmode/orgmode'
    use {
        "aurum77/live-server.nvim",
        run = function()
            require "live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    }
    -- LSP
    --   use {
    --       'VonHeikemen/lsp-zero.nvim',
    --       requires = {
    --           -- LSP Support
    --           {'williamboman/mason.nvim'},
    --           {'williamboman/mason-lspconfig.nvim'},
    --
    --           -- Autocompletion
    --           {'hrsh7th/cmp-buffer'}, -- nvim-cmp source for buffer words
    --           {'hrsh7th/cmp-path'},-- nvim-cmp source for filesystem paths
    --           {'hrsh7th/cmp-nvim-lua'}, -- nvim-cmp source for neovim Lua runtime API
    --           {'saadparwaiz1/cmp_luasnip'}, -- luasnip completion source for nvim-cmp
    --
    --           -- Snippets
    --           {'rafamadriz/friendly-snippets'},
    --       }
    --   }
    --   ]]
end)
