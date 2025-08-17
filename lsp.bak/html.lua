-- local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
-- htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'templ', 'blade' },
  root_markers = { 'package.json', '.git' },
  settings = {},
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  },
  -- capabilites = htmlCapabilities,
}
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua
