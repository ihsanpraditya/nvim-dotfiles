-- See which-key.txt for custom mapping label
-- Leader
vim.g.mapleader = ","

-- Directory
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>te", ':tabe <C-R>=expand("%:p:h") . "/" <CR>')


-- Files
vim.keymap.set("n", "<leader>s", ':source<CR>') -- sourcing
vim.keymap.set("n", "<leader>w", vim.cmd.write) -- saving
vim.keymap.set("n", "<C-z>", vim.cmd.write) -- remap C-z to saving
vim.keymap.set("n", "<leader>q", vim.cmd.quit) -- quiting
vim.keymap.set("n", "<leader>Q",":q!<CR>") -- force quit
vim.keymap.set("n", "<leader>1", vim.cmd.only) -- close other windows

-- Buffer
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete) -- close current buffer
vim.keymap.set("n", "<leader>C", ':bdelete!<CR>') -- close current buffer
vim.keymap.set("n", "<leader>z", vim.cmd.bprevious) -- go to previous buffer
vim.keymap.set("n", "<leader>x", vim.cmd.bnext) -- go to next buffer

-- Split
vim.keymap.set("n", "<leader>vz", vim.cmd.sbprevious) -- split then go to previous buffer
vim.keymap.set("n", "<leader>vx", vim.cmd.sbnext) -- split then go to next buffer
vim.keymap.set("n", "<leader>vv", vim.cmd.vsplit) -- split vertically
vim.keymap.set("n", "<leader>hv", vim.cmd.split) -- split horizontally

-- Tab
vim.keymap.set("n", "<TAB>", vim.cmd.tabnext) -- go to next tab
vim.keymap.set("n", "<S-TAB>", vim.cmd.tabprevious) -- go to previous tab
vim.keymap.set("n", "<S-t>", vim.cmd.tabnew) -- create new tab

-- <Esc>
vim.keymap.set("i", "jk", "<Esc>") -- map <jk> to <Esc>
vim.keymap.set("t", "jk", "<C-\\><C-n>") -- map <jk> to <Esc>

-- Others: Plugins remap at after/plugin/<plugin_name>.lua
vim.keymap.set("n", "<leader>;", ':Dashboard<CR>') -- map <ESC> to clear highlight search
vim.keymap.set("n", "<leader>n", ':DashboardNewFile<CR>') -- map <ESC> to clear highlight search
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch) -- map <ESC> to clear highlight search
vim.keymap.set("n", "<leader>.",":lcd %:p:h<CR>") -- make directory to the current buffer
vim.keymap.set("n", "<F3>",":Telescope colorscheme<CR>") -- make directory to the current buffer
vim.keymap.set("n", "<leader>O", 'O<ESC>') -- insert up blank line
vim.keymap.set("n", "<leader>o", 'o<ESC>') -- insert down blank line
