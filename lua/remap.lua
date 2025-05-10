-- See which-key.txt for custom mapping label
-- Leader
vim.g.mapleader = " "

-- Directory
vim.keymap.set("n", "<leader>d", ':Explore<CR>')
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>E", ':tabe <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>V", ':vsp <C-R>=expand("%:p:h") . "/" <CR>')


-- Files
-- vim.keymap.set("n", "<leader>s", ':source<CR>') -- sourcing
vim.keymap.set("n", "<leader>w", ':write<CR>') -- saving
vim.keymap.set("n", "<leader>q", ':quit<CR>')  -- quitting
vim.keymap.set("n", "<leader>Q", ":q!<CR>")    -- force quit
-- vim.keymap.set("n", "<leader>1", ':only<CR>') -- close other windows

-- Buffer
vim.keymap.set("n", "<leader>c", ':close<CR>')     -- close current buffer
vim.keymap.set("n", "<leader>C", ':close!<CR>')    -- force close current buffe
vim.keymap.set("n", "<leader>z", ':bprevious<CR>') -- go to previous buffer
vim.keymap.set("n", "<leader>x", ':bnext<CR>')     -- go to next buffer

-- Split
vim.keymap.set("n", "<leader>vz", ':sbprevious<CR>') -- split then go to previous buffer
vim.keymap.set("n", "<leader>vx", ':sbnext<CR>')     -- split then go to next buffer
vim.keymap.set("n", "<leader>vv", ':vsplit<CR>')     -- split vertically
vim.keymap.set("n", "<leader>hv", ':split<CR>')      -- split horizontally

-- Tab
vim.keymap.set("n", "<leader>s", ':tabnext<CR>')     -- go to next tab
vim.keymap.set("n", "<leader>a", ':tabprevious<CR>') -- go to previous tab
-- vim.keymap.set("n", "<S-t>", ':tabnew<CR>') -- create new tab

-- <Esc>
vim.keymap.set("i", "jk", "<Esc>")       -- map <jk> to <Esc>
vim.keymap.set("t", "jk", "<C-\\><C-n>") -- map <jk> to <Esc>

-- Others: Plugins remap at after/plugin/<plugin_name>.lua
vim.keymap.set("n", "<leader>n", ':enew<CR>')
vim.keymap.set("n", "<ESC>", ':nohlsearch<CR>')                 -- map <ESC> to clear highlight search
vim.keymap.set("n", "<leader>.", ":lcd %:p:h<CR>")              -- make directory to the current buffer
-- vim.keymap.set("n", "<F3>",":Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>O", 'O<ESC>')                      -- insert up blank line
vim.keymap.set("n", "<leader>o", 'o<ESC>')                      -- insert down blank line
vim.keymap.set("n", "<leader>t", ':NvimTreeToggle<CR>')         -- toggle file explorer
vim.keymap.set("n", "<leader>y", ':NvimTreeFindFileToggle<CR>') -- toggle file explorer
-- vim.keymap.set("n", "<leader>u", ':UndotreeToggle<CR>') -- toggle the undo history menu
-- vim.keymap.set("n", "<leader>U", ':UndotreeFocus<CR>') -- switch cursor to undo menu

vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>g', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>r', ':FzfLua oldfiles<CR>')
-- vim.keymap.set('n', '<leader>fx', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- Twiddle Case Function
local function twiddle_case(str)
  local result
  if str:upper() == str then
    result = str:lower()
  elseif str:lower() == str then
    result = str:gsub("(%w+)", function(word) return word:sub(1, 1):upper() .. word:sub(2) end)
  else
    result = str:upper()
  end
  return result
end

-- Mapping for visual mode
vim.keymap.set("v", '~', twiddle_case(vim.fn.getreg('"')))
