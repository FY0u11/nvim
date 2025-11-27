return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			diagnostics = {
				win = {
					position = "right",
					size = { width = 0.2 },
				},
			},
			symbols = {
				win = {
					position = "right",
					size = { width = 0.2 },
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Document symbols",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=true<cr>",
			desc = "LSP Definitions / references / ...",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle focus=true<cr>",
			desc = "Location List",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle focus=true<cr>",
			desc = "Quickfix List",
		},
	},
}
