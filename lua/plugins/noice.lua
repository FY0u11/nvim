return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { icon = ">" },
					search_down = { icon = "🔍⌄" },
					search_up = { icon = "🔍⌃" },
				},
			},
			presets = {
				command_palette = true,
			},
		})
	end,
}
