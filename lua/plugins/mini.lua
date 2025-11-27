return {
	"nvim-mini/mini.nvim",
	version = false,

	config = function()
		-- Setup mini.pairs for auto-pairing brackets
		require("mini.pairs").setup({
			-- Configuration here, or leave empty for defaults
			modes = { insert = true, command = false, terminal = false },

			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],

			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },

			-- skip autopair when next character is closing pair
			skip_unbalanced = true,

			-- better deal with markdown code blocks
			markdown = true,
		})
	end,
}
