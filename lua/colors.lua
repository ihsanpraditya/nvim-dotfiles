function trp_theme(color)
	color = color or "rose-pine" -- this make rose-pine as default if empty
	vim.cmd.colorscheme(color)
    -- for transparency, these 2 lines make the function just for Neovim within terminal
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

if vim.g.neovide then
    vim.cmd.colorscheme("nightfox") -- I love nightfox as Neovide default theme
else
    -- an empty will set rose-pine at startup, you may call it by :lua trp_theme("your color name")
    trp_theme()
end
