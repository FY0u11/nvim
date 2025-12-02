return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		require("which-key").setup(opts)
		require("which-key").add({
			{ "<leader>g", group = "git" },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "file" },
			{ "<leader>a", group = "avante" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>q", group = "session" },
			{ "<leader>s", group = "search" },
			{ "<leader>u", group = "ui" },
			{ "<leader>d", group = "debug" },
		})
	end,
}
