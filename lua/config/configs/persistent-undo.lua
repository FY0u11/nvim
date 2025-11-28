-- Create undo directory if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = undodir
vim.opt.undolevels = 10000 -- History limit
-- vim.opt.undoreload: if a file was modified externally, this option specifies
-- a maximum of lines of a file at which we don't discard the undo history
vim.opt.undoreload = 10000
