-- Global toggle
vim.api.nvim_create_user_command("FormatToggle", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	print("Auto-format globally: " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, {})

-- Buffer-local toggle
vim.api.nvim_create_user_command("FormatToggleBuffer", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	print("Auto-format for this buffer: " .. (vim.b.disable_autoformat and "disabled" or "enabled"))
end, {})
