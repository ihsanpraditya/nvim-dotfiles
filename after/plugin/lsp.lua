local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- require('lspconfig').stimulus_ls.setup({
--     cmd = { "stimulus-language-server", "--stdio" },
--     root_dir = function(pattern)
--       local cwd = vim.loop.cwd()
--       local root = util.root_pattern('composer.json', '.git')(pattern)
--
--       -- prefer cwd if root is a descendant
--       return util.path.is_descendant(cwd, root) and cwd or root
--     end,
-- })
-- require('lspconfig').tsserver.setup{
--   on_attach=custom_attach;
--   on_new_config=function (new_config)
--     local pnp_root = nvim_lsp.util.search_ancestors(new_config.root_dir, function(path)
--       local bin = nvim_lsp.util.path.join(path, ".yarn", "sdks", "typescript", "bin", "tsserver")
--       if nvim_lsp.util.path.is_file(bin) then
--         return bin
--       end
--     end)
--
--     if pnp_root then
--       local pnp_tsserver = nvim_lsp.util.path.join(pnp_root, ".yarn", "sdks", "typescript", "bin", "tsserver")
--       table.insert(new_config.cmd, "--tsserver-path")
--       table.insert(new_config.cmd, pnp_tsserver)
--     end
--   end;
-- }
require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
