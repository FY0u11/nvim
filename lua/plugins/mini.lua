return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		-- Setup mini.pairs for auto-pairing brackets
		require("mini.pairs").setup({
			-- Configuration here, or leave empty for defaults
			modes = { insert = true, command = false, terminal = false },
			-- Skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- Skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- Skip autopair when next character is closing pair
			skip_unbalanced = true,
			-- Better deal with markdown code blocks
			markdown = true,
		})
		-- Setup mini.move for moving lines
		require("mini.move").setup({
			mappings = {
				-- Move visual selection
				left = "<A-h>",
				right = "<A-l>",
				down = "<A-j>",
				up = "<A-k>",
				-- Move current line in normal mode
				line_left = "<A-h>",
				line_right = "<A-l>",
				line_down = "<A-j>",
				line_up = "<A-k>",
			},
		})
	end,
}
