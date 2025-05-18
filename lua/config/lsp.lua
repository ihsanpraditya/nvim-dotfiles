-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

-- Inlay Hint
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints',
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method('textDocument/inlayHint') then  -- supports_method() is deprecated
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

-- LSP Completion
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
    -- Trigger lsp completion manually using Ctrl + ,
        vim.keymap.set('i', '<c-space>', function()
          vim.lsp.completion.get()
        end)
  end
})

-- Snippet Completion in %:h/snippet.lua

-- Bindings
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true})

-- Running the server
-- Working with frontend
vim.lsp.enable('html')
vim.lsp.enable('cssls')
-- vim.lsp.enable('cssvar')
-- vim.lsp.enable('cssmodule')
vim.lsp.enable('jsquicklint')
vim.lsp.enable('bashls')
-- vim.lsp.enable('volar') -- done by ts_ls if you want
-- vim.lsp.enable('emmet')  -- not yet configured

-- Working with backend
-- vim.lsp.enable('tsls')
vim.lsp.enable('intelephense')  -- php
vim.lsp.enable('laravells')
vim.lsp.enable('marksman')  -- markdown

-- Other environment
vim.lsp.enable('vimls') -- vimscript
vim.lsp.enable('luals') -- for Neovim Lua config
vim.lsp.enable('pylsp')  -- python
