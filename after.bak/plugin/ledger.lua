-- Set Ledger-specific options
vim.g.ledger_maxwidth = 80
vim.g.ledger_fillstring = '    -'
vim.g.ledger_detailed_first = 1
vim.g.ledger_fuzzy_account_completion = 1
vim.g.ledger_fold_blanks = 0
vim.g.ledger_extra_options = '--pedantic --explicit --check-payees'

-- Set up autocommands for Ledger file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ledger",
    callback = function()
        vim.api.nvim_set_keymap('n', '{', '?^\\d<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '}', '/^\\d<CR>', { noremap = true, silent = true })
    end,
})

-- Check if Tabularize exists and add pattern if it does
if not vim.fn.exists(':Tabularize') then
    vim.fn.AddTabularPattern('ledger_record_account', '\\(.*\\)\\@<=\\s\\s', '/l0c0r0')
end
