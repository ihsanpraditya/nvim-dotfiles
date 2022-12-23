-- Leader
vim.g.mapleader = ","

-- Entering Directory Mode
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- Quick Shortcuts
vim.keymap.set("n", "<leader>s", vim.cmd.source) -- sourcing
vim.keymap.set("n", "<leader>w", vim.cmd.write) -- saving
vim.keymap.set("n", "<C-z>", vim.cmd.write) -- remap C-z to saving
vim.keymap.set("n", "<leader>q", vim.cmd.quit) -- quiting
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete) -- close current buffer
vim.keymap.set("n", "<leader>z", vim.cmd.bprevious) -- go to previous buffer
vim.keymap.set("n", "<leader>x", vim.cmd.bnext) -- go to next buffer
vim.keymap.set("n", "<leader>vz", vim.cmd.sbprevious) -- split then go to previous buffer
vim.keymap.set("n", "<leader>vx", vim.cmd.sbnext) -- split then go to next buffer
vim.keymap.set("n", "<leader>vv", vim.cmd.vsplit) -- split vertically
vim.keymap.set("n", "<leader>hv", vim.cmd.split) -- split horizontally
vim.keymap.set("n", "<leader>o", vim.cmd.only) -- close other windows
vim.keymap.set("n", "<leader>Q",":0q<CR>") -- close current windows
vim.keymap.set("n", "<TAB>", vim.cmd.tabnext) -- go to next tab
vim.keymap.set("n", "<S-TAB>", vim.cmd.tabprevious) -- go to previous tab
vim.keymap.set("n", "<S-t>", vim.cmd.tabnew) -- create new tab
-- vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch) -- map <ESC> to clear highlight search
vim.keymap.set("n", "<leader>.",":lcd %:p:h<CR>") -- make directory to the current buffer

-- Telescope Remap at after/plugin/telescope.lua
