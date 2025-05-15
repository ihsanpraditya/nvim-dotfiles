-- index
-- initial local shorthand
-- load snippets that installed as dependencies
-- bindings
-- custom snippet


-- LOCAL SHORTHANDS
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local sn = ls.snippet_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

-- LOAD DEPENDENCIES SNIPPETS
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("blade", {"html", "php"})

-- learn more for codes below
-- ls.setup({
--   load_ft_func =
--   -- Also load both html and php when a markdown-file is opened,
--   -- javascript for html.
--   -- Other filetypes just load themselves.
--       require("luasnip.extras.filetype_functions").extend_load_ft({
--         blade = { "html", "php" },
--         html = { "javascript" }
--       })
-- })

-- BINDINGS
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- CUSTOM SNIPPETS
ls.add_snippets("all", {
  s("hor", {
    t("your snippet engine works correctly!")
  })
})

function CheckSnippet()
  print(vim.inspect(require("luasnip").get_snippet_filetypes()))
end
