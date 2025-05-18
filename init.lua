-- all required files at lua folder
require("plugins")
require("termguicolors")
require("remap")
require("functions")
vim.loader.enable({ true }) -- might improve startup time but experimental

---------- INDEX ----------
-- MOUSE
-- NUMBER
-- TAB
-- UNDO/REDO
-- SEARCHING
-- COLORCOLUMN
-- CONCEAL
-- UPDATETIME
-- COMPLETION
-- DIRECTORY MODE
-- PROVIDER
-- Return to last position
-- NEOVIDE
---------------------------
local op = vim.o

-- MOUSE
op.mouse = "a"
op.mousemoveevent = true

-- NUMBER
op.number = true
op.relativenumber = true
op.wrap = false

-- TAB
-- always insert spaces
op.tabstop = 2
op.shiftwidth = 2
op.expandtab = true

op.swapfile = true
op.backup = true

-- UNDO / REDO
-- op.undodir = os.getenv("HOME") .. "/.vim/undodir"
op.undofile = true -- undo history persists although exiting the buffer.

-- SEARCHING
op.incsearch = true
op.hlsearch = true
op.ignorecase = true
op.smartcase = true
op.cursorline = true

op.scrolloff = 8
op.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- CONCEAL
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- UPDATETIME
op.updatetime = 50

-- op.colorcolumn = "80" -- show vertical line in column 80

-- COMPLETION
-- vim.opt.omnifunc = 'syntaxcomplete#Complete'

-- DIRECTORY MODE
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

-- PROVIDER
if vim.fn.has('win32') or vim.loop.os_uname().sysname == "Windows_NT" then
  vim.g.python3_host_prog = vim.fn.substitute(vim.fn.exepath("python"), ".exe$", '', 'g')
  vim.g.node_host_prog = "C:/Users/ACER/AppData/Roaming/npm/node_modules/neovim/bin/cli.js"
  -- vim.g.loaded_node_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_ruby_provider = 0
end

-- Return to last edit position when opening files (You want this!)
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line_num = vim.fn.line("'\"")
    if line_num > 1 and line_num <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

---------- NEOVIDE ----------
if vim.g.neovide then
  vim.cmd.cd('~') -- set directory to HOME
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

  vim.keymap.set('n', '<C-S-s>', ':w<CR>')      -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y')         -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-r>+')      -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
end

require("colors") -- error in this file causes not load other config
