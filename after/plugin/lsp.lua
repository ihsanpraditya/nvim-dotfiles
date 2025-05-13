-- INDEX
-- Config per language
--  lua_ls
--  intelephense (php)
-- Inlay Hint
-- Diagnostics sign text
-- Format on save
-- Completion
-- Running the server

-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

-- ###################### START LANGUAGE SERVER CONFIG #######################
-- HTML
vim.lsp.config['html'] = {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'templ', 'blade' },
  root_markers = { 'package.json', '.git' },
  settings = {},
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssls.lua
vim.lsp.config['cssls'] = {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  root_markers = { 'package.json', '.git' },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/css_variables.lua
vim.lsp.config['css_variables'] = {
  cmd = { 'css-variables-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  root_markers = { 'package.json', '.git' },
  -- Same as inlined defaults that don't seem to work without hardcoding them in the lua config
  -- https://github.com/vunguyentuan/vscode-css-variables/blob/763a564df763f17aceb5f3d6070e0b444a2f47ff/packages/css-variables-language-server/src/CSSVariableManager.ts#L31-L50
  settings = {
    cssVariables = {
      lookupFiles = { '**/*.less', '**/*.scss', '**/*.sass', '**/*.css' },
      blacklistFolders = {
        '**/.cache',
        '**/.DS_Store',
        '**/.git',
        '**/.hg',
        '**/.next',
        '**/.svn',
        '**/bower_components',
        '**/CVS',
        '**/dist',
        '**/node_modules',
        '**/tests',
        '**/tmp',
      },
    },
  }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssmodules_ls.lua
vim.lsp.config['cssmodules_ls'] = {
  cmd = { 'cssmodules-language-server' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json' }
}

vim.lsp.config['quick_lint_ls'] = {
  cmd = { 'quick-lint-js', '--lsp-server' },
  filetypes = { 'javascript', 'typescript' },
  root_markers = { 'package.json', 'jsconfig.json', '.git' },
}

-- example config.json that disables type checking in JavaScript files.
-- {
--   "compilerOptions": {
--     "module": "commonjs",
--     "target": "es6",
--     "checkJs": false
--   },
--   "exclude": [
--     "node_modules"
--   ]
-- }
-- JavaScript, TypeScript, Vue
vim.lsp.config['ts_ls'] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" }
      }
    }
  }
}

-- As of 2.0.0, Volar no longer supports TypeScript itself. Instead, a plugin adds Vue support to this language server.
-- IMPORTANT: It is crucial to ensure that @vue/typescript-plugin and volar are of identical versions.
-- You must make sure volar is setup
-- e.g. vim.lsp.config('volar')
-- See volar's section for more information
-- location MUST be defined. If the plugin is installed in node_modules, location can have any value.
-- languages must include vue even if it is listed in filetypes.
-- filetypes is extended here to include Vue SFC.
vim.lsp.config['volar'] = {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  root_markers = { "package.json" },
  init_options = {
    vue = {
      hybridMode = false -- disable hybrid mode
    },
    -- Overriding the default TypeScript Server used by Volar
    typescript = {
      tsdk = "" -- replace with your global TypeScript library path
    },
    before_init = function(_, config)
      local lib_path = vim.fs.find('node_modules/typescript/lib', { _ , upward = true })[1]
      if lib_path then
        config.init_options.typescript.tsdk = lib_path
      end
    end
  }
}

-- EMMET
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- vim.lsp.config['ls_emmet'] = {
--   cmd = { 'ls_emmet', '--stdio' };
--   filetypes = {
--     'html',
--     'css',
--     'scss',
--     'blade',
--     'javascriptreact',
--     'typescriptreact',
--     'haml',
--     'xml',
--     'xsl',
--     'pug',
--     'slim',
--     'sass',
--     'stylus',
--     'less',
--     'sss',
--     'hbs',
--     'handlebars',
--   },
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
--   settings = {},
--   capabilities = capabilities
-- }

-- PHP
-- https://github.com/bmewburn/intelephense-docs/blob/master/installation.md
vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
        associations = { '*.php', '*.phtml', '*.blade.php' }
      },
      completion = {
        insertUseDeclaration = true
      },
      format = {
        enable = true
      },
      diagnostics = {
        enable = true,
        run = 'onType' -- | onSave
      }
    }
  }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/laravel_ls.lua
vim.lsp.config['laravel-ls'] = {
  cmd = { 'laravel-ls' },
  filetypes = { 'php', 'blade' },
  root_markers = { 'artisan' }
}
-- LUA
-- https://luals.github.io/wiki/settings
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      completion = {
        enable = true
      },
      hint = {
        enable = true
      },
      format = {
        enable = true
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' }
      }
    }
  }
}

vim.lsp.config['bashls'] = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)'
    }
  }
}

vim.lsp.config['marksman'] = {
  cmd = { "marksman", "server" },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.marksman.toml', '.git' }
}

vim.lsp.config['vimls'] = {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  root_markers = { ".git" },
  init_options = {
    {
      diagnostic = {
        enable = true
      },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        runtimepath = true
      },
      isNeovim = true,
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true
      },
      vimruntime = ""
    }
  }
}

-- PYTHON
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/pylsp.lua
vim.lsp.config['pylsp'] = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

-- ####################### END LANGUAGE SERVER CONFIG ########################

-- Inlay Hint
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints',
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method('textDocument/inlayHint') then
      return
    end

    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
  end,
})


-- Change diagnostics sign text
vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
  virtual_text = true
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

-- Format on save
-- local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', { clear = true })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'Setup format on save',
--   callback = function(event)
--     local id = vim.tbl_get(event, 'data', 'client_id')
--     local client = id and vim.lsp.get_client_by_id(id)
--     if client == nil then
--       return
--     end

--     vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = event.buf })

--     local buf_format = function(e)
--       vim.lsp.buf.format({
--         bufnr = e.buf,
--         async = false, -- If true the method won't block. Editing the buffer while formatting asynchronous can lead to unexpected changes.
--         timeout_ms = 10000,
--       })
--     end

--     vim.api.nvim_create_autocmd('BufWritePre', {
--       buffer = event.buf,
--       group = fmt_group,
--       desc = 'Format current buffer',
--       callback = buf_format,
--     })
--   end
-- })
--
-- I prefer manually format
function Format()
  vim.lsp.buf.format({
    async = false,
    timeout_ms = 10000,
  })
end

-- Completion
vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable vim.lsp.completion',
  callback = function(event)
    local client_id = vim.tbl_get(event, 'data', 'client_id')
    if client_id == nil then
      return
    end

    -- warning: this api is unstable
    vim.lsp.completion.enable(true, client_id, event.buf, {autotrigger = false})

    -- warning: this api is unstable
    -- Trigger lsp completion manually using Ctrl + Space
    vim.keymap.set('i', '<C-,>', '<cmd>lua vim.lsp.completion.trigger()<cr>')
  end
})

-- Running the server
-- Working with frontend
vim.lsp.enable('html')
vim.lsp.enable('cssls')
-- vim.lsp.enable('css_variables')
-- vim.lsp.enable('cssmodules_ls')
vim.lsp.enable('quick_lint_ls')
vim.lsp.enable('bashls')
-- vim.lsp.enable('volar') -- done by ts_ls if you want
-- vim.lsp.enable('ls_emmet')  -- not yet configured

-- Working with backend
-- vim.lsp.enable('ts_ls')
vim.lsp.enable('intelephense')  -- php
vim.lsp.enable('laravel-ls')
vim.lsp.enable('marksman')  -- markdown

-- Other environment
vim.lsp.enable('vimls') -- vimscript
vim.lsp.enable('lua_ls') -- for Neovim Lua config
vim.lsp.enable('pylsp')  -- python
