return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap
      vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        -- opts.desc = "Show LSP type definitions"
        -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        -- opts.desc = "See available code actions"
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
        --
        -- opts.desc = "Smart rename"
        -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
        --
        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
        --
        -- opts.desc = "Show line diagnostics"
        -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        local function jump_diagnostic(delta)
          return function()
            vim.diagnostic.jump({ count = delta, float = true })
          end
        end
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", jump_diagnostic(-1), opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", jump_diagnostic(1), opts) -- jump to next diagnostic in buffer

        opts.desc = "Show error in float window"
        keymap.set("n", "[e", vim.diagnostic.open_float, opts)

        opts.desc = "Add error to location list"
        keymap.set("n", "]e", vim.diagnostic.setloclist, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘ ",
            [vim.diagnostic.severity.WARN] = "▲ ",
            [vim.diagnostic.severity.HINT] = "⚑ ",
            [vim.diagnostic.severity.INFO] = "» ",
          },
        },
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("astro", {
        init_options = {
          typescript = {
            tsdk = '/home/sanArch/.nvm/versions/node/v22.11.0/lib/node_modules/typescript/lib'
          },
        },
      })

      vim.lsp.config('denols', {
        root_dir = require("lspconfig").util.root_pattern({"deno.json", "deno.jsonc"}),
      })

      vim.lsp.config('emmet_ls', {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      })

      -- docs: https://github.com/bmewburn/intelephense-docs/blob/master/installation.md
      vim.lsp.config('intelephense', {
        filetypes = { 'php', 'blade', 'php_only' },
        settings = {
          intelephense = {
            files = {
              maxSize = 1000000,
              associations = { '*.php', '*.phtml', '*.blade.php' }
            },
            completion = {
              enable = true
            },
            format = {
              enable = true
            },
            environment = {
              includePaths = {
                vim.fs.joinpath(vim.fn.getcwd(), '_ide_helper.php')
              }
            },
            stubs = {
              'standard',
              'Core',
              'date',
              'phpunit',
              'laravel',
              'pcre',
              'intl'
            },
            diagnostics = {
              enable = true,
              run = 'onType', -- onType | onSave
              -- undefinedMethods = false
            },
          },
        },
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            completion = {
              callSnippet = "Replace",
            },
          }
        },
      })

      vim.lsp.config('svelte', {})

      vim.lsp.config('ts_ls', {
        root_dir = require("lspconfig").util.root_pattern({ "package.json", "tsconfig.json" }),
        single_file_support = false,
      })

      vim.lsp.config('vue_ls', {})
    end,
  },{
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",          -- source for text in buffer
      "hrsh7th/cmp-path",            -- source for file system paths
      -- "hrsh7th/cmp-omni",
      "L3MON4D3/LuaSnip",            -- snippet engine
      "saadparwaiz1/cmp_luasnip",    -- for luasnip completion source for nvim-cmp
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local types = require('cmp.types')
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.filetype_extend("blade", {"html", "php"})
      luasnip.filetype_extend("vue", {"html"})
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }), -- previous suggestion
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }), -- previous suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- previous suggestion
          ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- previous suggestion
          ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestion
          ['<C-e>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          -- {
          --   name = 'omni',
          --   option = {
          --     disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' }
          --   }
          -- },
        }),
      })

      vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })

    end,
  },
}
