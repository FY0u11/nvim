return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			routes = { -- This fixes error with !cmd
				{
					filter = { event = "msg_show", kind = { "shell_out", "shell_err" } },
					view = "notify",
					opts = {
						level = "info",
						skip = false,
						replace = false,
					},
				},
			},
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
