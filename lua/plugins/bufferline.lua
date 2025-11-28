return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- Set to "tabs" to show actual tabs
				numbers = "none", -- Options: "none" | "ordinal" | "buffer_id" | "both"
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎",
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' }
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				always_show_bufferline = true,
			},
		})
		-- Keymaps for buffer navigation
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })
		vim.keymap.set("n", "<leader>X", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
	end,
}
