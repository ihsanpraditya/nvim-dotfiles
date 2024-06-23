-- all required files at lua folder
require("plugins")
require("colors")
require("remap")
vim.loader.enable() -- might improve startup time

---------- INDEX ----------
-- NUMBER
-- TAB
-- UNDO/REDO
-- SEARCHING
-- COLORCOLUMN
-- CONCEAL
-- UPDATETIME
-- DIRECTORY MODE
-- PROVIDER
-- NEOVIDE
---------------------------
local op = vim.opt

-- NUMBER
op.number = true
op.relativenumber = true
op.wrap = false

-- TAB
op.tabstop = 2
op.shiftwidth = 2
op.softtabstop = 0
op.expandtab = true

op.swapfile = false
op.backup = false

-- UNDO / REDO
-- uncomment so the undo history is saved although exiting the buffer.
-- op.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- op.undofile = true

-- SEARCHING
op.incsearch = true
op.hlsearch = true
op.cursorline = true

op.scrolloff = 8
op.signcolumn = "yes"
op.isfname:append("@-@")

-- CONCEAL
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- UPDATETIME
op.updatetime = 50

-- op.colorcolumn = "80" -- show vertical line in column 80

-- DIRECTORY MODE
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

-- PROVIDER
if vim.fn.has('win32') or vim.loop.os_uname().sysname == "Windows_NT" then
vim.g.python3_host_prog =  vim.fn.substitute(vim.fn.exepath("python"), ".exe$", '', 'g')
-- vim.g.node_host_prog = 0
-- vim.g.perl_host_prog = 0
end

---------- NEOVIDE ----------
if vim.g.neovide then
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.0
-- vim.o.lines = 20
-- vim.o.columns = 60
vim.o.guifont = "CaskaydiaMono NFM:h10"

-- FLOATING BLUR AMOUNT
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- HIDING THE MOUSE WHEN TYPING
vim.g.neovide_hide_mouse_when_typing = true

-- REMEMBER PREVIOUS WINDOW SIZE
-- vim.g.neovide_remember_window_size = true
end
