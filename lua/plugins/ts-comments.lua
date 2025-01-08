MiniDeps.add({ source = "folke/ts-comments.nvim" })

local function configure()
	print("CONFIG")
	require("ts-comments").setup({
		javascript = {
			"// %s", -- default commentstring when no treesitter node matches
			"/* %s */",
			call_expression = "// %s", -- specific commentstring for call_expression
			jsx_attribute = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			spread_element = "// %s",
			statement_block = "// %s",
		},
		styled = "/* %s */",
		typescriptreact = {
			"// %s", -- default commentstring when no treesitter node matches
			"/* %s */",
			call_expression = "// %s", -- specific commentstring for call_expression
			jsx_attribute = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			spread_element = "// %s",
			statement_block = "// %s",
		},
		tsx = {
			"// %s", -- default commentstring when no treesitter node matches
			"/* %s */",
			call_expression = "// %s", -- specific commentstring for call_expression
			jsx_attribute = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			spread_element = "// %s",
			statement_block = "// %s",
			tsxRegion = "hello %s hello",
		},
		typescript = { "// %s", "/* %s */" }, -- langs can have multiple commentstrings
	})
end

MiniDeps.later(configure())
