return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = {
		default_mappings = true,
		default_commands = true,
		disable_diagnostics = true,
		highlights = {
			incoming = "DiffAdd",
			current = "DiffText",
		},
	},
}
