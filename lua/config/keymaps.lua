-- Make ctrl+backspace to delete entire word
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })
-- Navigate between windows with Ctrl+h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
-- Move by display lines (wrapped lines) instead of actual lines
vim.keymap.set("n", "j", "gj", { desc = "Move down by display line" })
vim.keymap.set("n", "k", "gk", { desc = "Move up by display line" })
-- Switch to normal mode
vim.keymap.set("i", "jk", "<C-[>", { desc = "Go back to normal mode" })
-- Re-size windows
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase window width" })
-- Disable search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
-- Save buffer with Ctrl+S
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save buffer" })
vim.keymap.set({ "i", "x" }, "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save buffer" })
-- Quit with save prompt
vim.keymap.set("n", "<leader>qq", "<cmd>confirm qa<cr>", { desc = "Quit" })
-- Force quit all without saving
vim.keymap.set("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force quit" })
-- Make replacing work like it should be
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })
-- Close other not modified buffers
vim.keymap.set("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	local closed = 0
	local modified = 0
	local to_close = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- Close all listed buffers except current
		if
			buf ~= current
			and vim.api.nvim_buf_is_valid(buf)
			and vim.bo[buf].buflisted
			and vim.bo[buf].buftype == ""
		then
			if vim.bo[buf].modified then
				modified = modified + 1
			else
				table.insert(to_close, buf)
			end
		end
	end
	for _, buf in ipairs(to_close) do
		local ok = pcall(vim.api.nvim_buf_delete, buf, { force = false })
		if ok then
			closed = closed + 1
		end
	end
	if modified > 0 then
		vim.notify(
			string.format("Closed %d buffers, %d modified buffers remain", closed, modified),
			vim.log.levels.WARN
		)
	else
		vim.notify(string.format("Closed %d buffers", closed), vim.log.levels.INFO)
	end
end, { desc = "Close other buffers" })
-- Entire file text object with 'g'
vim.keymap.set({ "o", "x" }, "ig", ":<C-u>normal! ggVG<CR>", { desc = "Inside entire file" })
vim.keymap.set({ "o", "x" }, "ag", ":<C-u>normal! ggVG<CR>", { desc = "Around entire file" })
-------------------------
-- Unmap unneeded keys ---
-------------------------
vim.keymap.del("n", "gO") -- Duplicate of <leader>cs
vim.keymap.del("n", "<leader>x") -- Duplicate of <leader>bd
vim.keymap.del("n", "<leader>X") -- Neovim news <leader>bo
