require("luasnip.loaders.from_vscode").lazy_load()                                          -- loads friendly/snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } }) -- loads custom snippets
-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

local ls = require("luasnip")
local extras = require("luasnip.extras")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda


-- SNIPPETS

ls.add_snippets("lua", {
    s("clg", {
        t('console.log('),
        i(1),
        t(')')
    }),
    s("fn", {
        -- Simple static text.
        t("//Parameters: "),
        -- Last Placeholder, exit Point of the snippet.
        i(0),
        t({ "", "}" }),
    }),

})
