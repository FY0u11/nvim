-- Make ctrl+backspace to delete entire word
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })

-- Navigate between windows with Ctrl+h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Disable search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save buffer with Ctrl+S
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save buffer" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save buffer" }) -- Also works in insert mode

-- Quit with save prompt
vim.keymap.set("n", "<leader>qq", "<cmd>confirm qa<cr>", { desc = "Quit" })

-- Force quit all without saving
vim.keymap.set("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force quit" })

vim.keymap.set("n", "<leader>h", function()
	vim.cmd("enew") -- Create new buffer
	vim.bo.buftype = "nofile"
	vim.bo.filetype = "text" -- Set as plain text
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
end, { desc = "New scratch buffer" })

-------------------------
-- Unmap unneded keys ---
-------------------------
vim.keymap.del("n", "gO") -- dupplicate of <leader>cs
vim.keymap.del("n", "<leader>x") -- dupplicate of <leader>bd
vim.keymap.del("n", "<leader>X") -- neovim news <leader>bo
