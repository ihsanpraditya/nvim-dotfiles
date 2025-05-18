return {
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


