local op = vim.opt

op.number = true
op.relativenumber = true
op.wrap = false

op.tabstop = 4
op.shiftwidth = 4
op.softtabstop = 0
op.expandtab = true

op.swapfile = false
op.backup = false
op.undodir = os.getenv("HOME") .. "/.vim/undodir"
op.undofile = true

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

-- settings for directory mode
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"
