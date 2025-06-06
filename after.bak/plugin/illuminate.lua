require('illuminate').configure({
  providers = {
    'lsp',
    'regex',
  },
  delay = 100,
  filetypes_denylist = {
    'dirbuf',
    'dirvish',
    'fugitive',
  },
  under_cursor = true,
  large_file_cutoff = 10000,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
  case_insensitive_regex = false,
  disable_keymaps = false,
})
