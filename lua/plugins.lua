-- plugin with 'require' option also installs its requirement
-- so you don't have to type it anymore
---------- INDEX ----------
-- app features
--  fzf (fuzzy finder)
-- appearance
--  bufferline
--  lualine
--  icons (directory view)
--  colorscheme
-- editing
--  vim-fugitive Git integration
--  gitsigns Git integration for buffers
--  diffview simplifying Git diff split
--  indent
--  visual-multi
--  nvim-polyglot (Syntax)
--  nvim-comment
--  text-case
--  undotree
--  which-key
--  nvim-surround
--  nvim-autopairs
-- LSP

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer manage itself
    use 'wbthomason/packer.nvim'

    -- APP FEATURES
    use 'ibhagwan/fzf-lua'
    use 'nvim-tree/nvim-tree.lua'
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("dashboard").setup {
                theme = "hyper",
                config = {
                    packages = { enable = false },
                    project = { enable = true, limit = 8, icon = '', label = '', action = 'FzfLua files' },
                }
            }
        end,
        -- requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- APPEARANCE
    use {
        'akinsho/bufferline.nvim', -- buffer/tab bar
        -- requires = {'nvim-tree/nvim-web-devicons'}
    }
    use 'nvim-lualine/lualine.nvim'   -- status bar
    use 'nvim-tree/nvim-web-devicons' -- icons dired mode, used by many packages
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'Mofiqul/dracula.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'folke/tokyonight.nvim'

    -- EDITING
    use "tpope/vim-fugitive"                  -- Git Support for Neovim
    use "lewis6991/gitsigns.nvim"             -- Git integration for buffers
    use "sindrets/diffview.nvim"              -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    use 'lukas-reineke/indent-blankline.nvim' -- indent line
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'sheerun/vim-polyglot'
    use 'terrortylor/nvim-comment'
    use 'johmsalas/text-case.nvim' -- An all in one plugin for converting text case in Neovim
    -- use 'mbbill/undotree' -- Undo History Menu and increase it
    -- use 'folke/which-key.nvim' -- popup for available key
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
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
