local op = vim.opt

op.number = true
op.relativenumber = true

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

op.scrolloff = 8
op.signcolumn = "yes"
op.isfname:append("@-@")

op.updatetime = 50

op.colorcolumn = "80"
