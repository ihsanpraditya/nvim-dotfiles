function trp_theme(color)
  color = color or "desert" -- this make rose-pine as default if empty
  vim.cmd.colorscheme(color)
  -- for transparency, these 2 lines make the function just for Neovim within terminal
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

if vim.g.neovide then
    vim.cmd.colorscheme("nightfox") -- I love nightfox as Neovide default theme
else
  trp_theme()
end

if vim.g.colors_name == "desert"
then
  vim.opt.background = "light"
else
  vim.opt.background = "dark"
end
----- LIGHT COLOR -----
-- Blue (but set bg to dark, wkwk)
-- delek 
-- morning(not too light, good for night shift) 
-- peachpuff 
-- shine(dont use)
-- zellner 
----- DARK COLOR -----
-- Andromeda
-- DarkBlue
-- desert
-- elflord
-- evening
-- habamax
-- industry
-- koehler
-- macvim (not too good for gitgutter)
-- murphy
-- pablo
-- ron
-- slate (looks modern but light)
-- sorbet (beautiful purple)
-- torte
-- molokai
-- zaibatsu (more beautiful purple)
----- AMBI COLOR -----
-- lunaperche
-- PaperColor
-- quiet (no syntax)
-- retrobox
-- solarized
-- wildcharm
