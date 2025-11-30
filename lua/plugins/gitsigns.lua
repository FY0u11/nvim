return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gitsigns.next_hunk()
					end)
					return "<Ignore>"
				end, "Next hunk", { expr = true })

				map("n", "[h", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gitsigns.prev_hunk()
					end)
					return "<Ignore>"
				end, "Previous hunk", { expr = true })

				-- Actions
				map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage hunk")
				map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset hunk")
				map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")
				map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage buffer")
				map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset buffer")
				map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")
				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>ghd", gitsigns.diffthis, "Diff this")
				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, "Diff this ~")

				-- Git diff accept hunk
				vim.keymap.set({ "n", "x" }, "<leader>ghh", ":diffget LOCAL<CR>", { desc = "Get from LOCAL" })
				vim.keymap.set({ "n", "x" }, "<leader>ghl", ":diffget REMOTE<CR>", { desc = "Get from REMOTE" })

				-- Toggle
				map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, "Toggle git blame")
				map("n", "<leader>gtd", gitsigns.toggle_deleted, "Toggle deleted")

				-- Git blame
				map("n", "<leader>ga", ":BlameToggle window<CR>", "Toggle GitBl[a]me")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		})
	end,
}
