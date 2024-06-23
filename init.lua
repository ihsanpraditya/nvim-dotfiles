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
vim.g.node_host_prog =  "C:/Users/ACER/AppData/Roaming/npm/node_modules/neovim/lib/host/NvimPlugin.js"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
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

-- Popupmenu Transparency
vim.o.pumblend = 30

-- HIDING THE MOUSE WHEN TYPING
vim.g.neovide_hide_mouse_when_typing = true

-- REMEMBER PREVIOUS WINDOW SIZE
-- vim.g.neovide_remember_window_size = true

vim.keymap.set('n', '<C-S-s>', ':w<CR>') -- Save
vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
end
