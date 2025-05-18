vim.g.VM_mouse_mappings = 1
vim.keymap.set('n', '<C-LeftMouse>',    '<Plug>(VM-Mouse-Cursor)')
vim.keymap.set('n', '<C-RightMouse>',   '<Plug>(VM-Mouse-Word)')
vim.keymap.set('n', '<M-C-RightMouse>', '<Plug>(VM-Mouse-Column)')
vim.keymap.set('n', '<C-k>',            '<Plug>(VM-Add-Cursor-Up)')
vim.keymap.set('n', '<C-j>',            '<Plug>(VM-Add-Cursor-Down)')

-- for default mapping type ':h vm-mappings'
