return {
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


-- https://github.com/bmewburn/intelephense-docs/blob/master/installation.md
