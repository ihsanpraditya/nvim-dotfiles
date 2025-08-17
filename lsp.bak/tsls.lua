return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "home/sanArch/.nvm/versions/node/v22.11.0/lib/node_modules/@vue/typescript-plugin",
        languages = { "vue" }
      }
    },
    preferences = {
      includeInlayParameterNameHints = 'none', -- 'none' | 'literals' | 'all'
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = false,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true
    }
  }
}


