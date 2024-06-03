require("luasnip.loaders.from_vscode").lazy_load() -- loads friendly/snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } }) -- loads custom snippets require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("javascript", { "html" })

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local f = ls.function_node

local same = function(index)
	return f(function(arg)
		return arg[1]
	end, { index })
end

ls.filetype_extend("all", { "_" })

-- local types = require("luasnip.util.types")

ls.setup({
	update_events = { "TextChanged", "TextChangedI" },
	ext_opts = {
		-- [types.insertNode] = {
		--     active = { ... },
		--     visited = { ... },
		--     passive = { ... },
		--     snippet_passive = { ... }
		-- },
		[types.choiceNode] = {
			active = { ... },
			unvisited = { ... },
		},
		-- [types.snippet] = {
		--     passive = { ... }
		-- }
	},
})

-- testing snippets
ls.add_snippets("lua", {
	s("todos", {
		c(1, {
			t("TODO : "),
			t("FIXME : "),
			t("WARNING : "),
			t("INFO : "),
		}),
	}),
})

--          ╭─────────────────────────────────────────────────────────╮
--          │                   Javascript - React                    │
--          ╰─────────────────────────────────────────────────────────╯
ls.add_snippets("javascriptreact", {
	s("ef", {
		t({ "import React, { useState, useEffect } from 'react';", "" }),
		t({ "", "export default function " }),
		i(1, "name"),
		t({ "(" }),
		i(2, "props"),
		t({ ") {" }),
		t({ "", "   return <>" }),
		i(3),
		t({ "</>" }),
		t({ "", "}" }),
	}),
	s("ue", {
		t({ "React.useEffect(() => {", "" }),
		t({ "   " }),
		i(1),
		t({ "", "}, [" }),
		i(2),
		t({ "]", "" }),
	}),
	s("us", fmt("const [{}, set{}] = React.useState()", { i(1), i(2) })),
	s(
		"for",
		fmt(
			[[
      for (let {a} = 0; {a} < {}.length - 1 ; {a}++) {{
        {}
      }}
      ]],
			{
				a = i(1),
				i(2),
				i(3),
			},
			{
				repeat_duplicates = true,
			}
		)
	),
})

--          ╭─────────────────────────────────────────────────────────╮
--          │                   Typescript - React                    │
--          ╰─────────────────────────────────────────────────────────╯
ls.add_snippets("typescriptreact", {
	s("ef", {
		t({ "import React, { useState, useEffect } from 'react';", "" }),
		t({ "", "export default function " }),
		i(1, "name"),
		t({ "(" }),
		i(2, "props"),
		t({ ") {" }),
		t({ "", "   return <>" }),
		i(3),
		t({ "</>" }),
		t({ "", "}" }),
	}),
	s("ue", {
		t({ "React.useEffect(() => {", "" }),
		t({ "   " }),
		i(1),
		t({ "", "}, [" }),
		i(2),
		t({ "]", "" }),
	}),
	s("us", fmt("const [{}, set{}] = React.useState({})", { i(1), i(2), i(3) })),
	s(
		"for",
		fmt(
			[[
      for (let {a} = 0; {a} < {}.length - 1 ; {a}++) {{
        {}
      }}
      ]],
			{
				a = i(1),
				i(2),
				i(3),
			},
			{
				repeat_duplicates = true,
			}
		)
	),
})

--          ╭─────────────────────────────────────────────────────────╮
--          │                         Neogit                          │
--          ╰─────────────────────────────────────────────────────────╯
-- build: Changes related to build processes or tools.
-- chore: Regular maintenance or administrative tasks.
-- ci: Updates to the continuous integration setup.
-- docs: Documentation-related changes.
-- style: Changes that do not affect the code’s functionality (e.g., formatting).
-- refactor: Code modifications without changing its behavior.
-- perf: Performance improvements.
-- test: Adding or modifying tests.
ls.add_snippets("NeogitCommitMessage", {
	s("feat", fmt("✨ feat({}): {}", { i(1), i(2) })),
	s("fix", fmt("⚙️ fix({}): {}", { i(1), i(2) })),
	-- chore: tool changes, configuration changes, and changes to things that do not actually go into production at all.
	s("chore", fmt("🥑 chore({}): {}", { i(1), i(2) })),
	s("refactor", fmt("⚡️ refactor({}): {}", { i(1), i(2) })),
	s("style", fmt("🌈 style({}): {}", { i(1), i(2) })),
	s("test", fmt("🧪 test({}): {}", { i(1), i(2) })),
})
