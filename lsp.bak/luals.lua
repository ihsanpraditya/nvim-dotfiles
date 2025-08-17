return {
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
-- https://luals.github.io/wiki/settings
