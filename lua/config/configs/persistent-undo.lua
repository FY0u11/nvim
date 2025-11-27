-- Create undo directory if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = undodir
