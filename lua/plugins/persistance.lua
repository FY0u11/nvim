return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = function()
		require("persistence").setup()
		-- Keymaps
		vim.keymap.set("n", "<leader>qs", function()
			require("persistence").load()
		end, { desc = "Restore Session" })
		vim.keymap.set("n", "<leader>qS", function()
			require("persistence").select()
		end, { desc = "Select Session" })
		vim.keymap.set("n", "<leader>ql", function()
			require("persistence").load({ last = true })
		end, { desc = "Restore Last Session" })
		vim.keymap.set("n", "<leader>qd", function()
			require("persistence").stop()
		end, { desc = "Don't Save Current Session" })
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistenceSavePre",
			callback = function()
				-- Close all Snacks-related windows
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local buf = vim.api.nvim_win_get_buf(win)
					local ft = vim.bo[buf].filetype
					-- Only close windows with that not specific filetypes
					if ft:match("^snacks_") or ft:match("^trouble") then
						pcall(vim.api.nvim_win_close, win, true)
					end
				end
			end,
		})
	end,
}
