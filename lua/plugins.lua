-- plugin with 'require' option also installs its requirement
-- so you don't have to type it anymore
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --  Speed up loading Lua modules
    use 'lewis6991/impatient.nvim'

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} } -- Asynchronous programming using coroutines
    }
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Icons in Directory view(like Dired mode, telescope view)
    use 'nvim-tree/nvim-web-devicons'

    -- Colorscheme
    use {'rose-pine/neovim', as = 'rose-pine'}
    use 'Mofiqul/dracula.nvim'
    use 'EdenEast/nightfox.nvim'

    -- Appearance
    use 'lukas-reineke/indent-blankline.nvim' -- indent line
    use {'akinsho/bufferline.nvim', tag = "v3.*"} -- buffer/tab bar
    use 'nvim-lualine/lualine.nvim' -- status bar
    use 'terrortylor/nvim-comment'

    -- Editing
    -- use 'mbbill/undotree' -- Undo History Menu and increase it
    -- use 'folke/which-key.nvim' -- popup for available key
    use 'windwp/nvim-autopairs'
    use {'mg979/vim-visual-multi', branch = 'master'}
    use 'tpope/vim-fugitive' -- Git Support for Neovim
    --[[
    use {
        'nvim-treesitter/nvim-treesitter', -- Syntax Checking
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow' -- parenttheses colouring with treesitter
    -- use 'nvim-orgmode/orgmode'
    use {
        "aurum77/live-server.nvim",
        run = function()
            require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    }
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    ]]
end)
