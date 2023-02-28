require("plugins")
require("remap")

-- plugin configuration is at after/plugins/

-- Neovim Configuration
local op = vim.opt

-- number
op.number = true
op.relativenumber = true
op.wrap = false

-- Tab
op.tabstop = 4
op.shiftwidth = 4
op.softtabstop = 0
op.expandtab = true

op.swapfile = false
op.backup = false

-- Undo / Redo
-- uncomment so the undo history is saved although exiting the buffer.
-- op.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- op.undofile = true

-- Searching
op.incsearch = true
op.hlsearch = true
op.cursorline = true

op.scrolloff = 8
op.signcolumn = "yes"
op.isfname:append("@-@")

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

op.updatetime = 50

-- op.colorcolumn = "80" -- show vertical line in column 80

-- Directory mode
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"
