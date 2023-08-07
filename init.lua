-- all required files at lua folder
require("colors")
require("plugins")
require("remap")

-- ###############################################################################
-- NEOVIM CONFIGURATION
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

-- ###############################################################################
-- JUST FOR NEOVIDE NEOVIM DESKTOP CLIENT
if vim.g.neovide then

vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.0

-- Floating Blur Amount
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Hiding the mouse when typing
vim.g.neovide_hide_mouse_when_typing = true

-- Remember Previous Window Size
vim.g.neovide_remember_window_size = true

end --end for Neovide configuration
-- ###############################################################################
