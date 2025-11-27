-- diagnostict
vim.diagnostic.config({
	virtual_text = {
		spacing = 4, -- Space between code and message
		prefix = "●", -- Icon before message
		source = "if_many", -- Show source if multiple sources
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.HINT] = "󰌶",
			[vim.diagnostic.severity.INFO] = "󰋽",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
