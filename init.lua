require("config.functions")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
-- require("config.lsp")
require("config.lazy")
-- vim.loader.enable({ true }) -- might improve startup time but experimental
