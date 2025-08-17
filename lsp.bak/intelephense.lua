return {
  cmd = {
    'intelephense',
    '--stdio',
    '--log-file', '/tmp/intelephense.log',
  },
  filetypes = { 'php', 'blade', 'php_only' },
  root_markers = { 'composer.json', '.git' },
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
        'pcre'
      },
      diagnostics = {
        enable = true,
        run = 'onType', -- onType | onSave
        -- undefinedMethods = false
      }
    }
  }
}


-- https://github.com/bmewburn/intelephense-docs/blob/master/installation.md
