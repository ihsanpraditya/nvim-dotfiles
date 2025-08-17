local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  cmd = { 'ls_emmet', '--stdio' };
  filetypes = {
    'html',
    'css',
    'scss',
    'blade',
    'javascriptreact',
    'typescriptreact',
    'haml',
    'xml',
    'xsl',
    'pug',
    'slim',
    'sass',
    'stylus',
    'less',
    'sss',
    'hbs',
    'handlebars',
  },
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {},
  capabilities = capabilities
}


