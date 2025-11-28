-- Theme
vim.cmd.colorscheme("oxocarbon")
-- Copy & paste to windows and vice-versa
vim.opt.clipboard = "unnamedplus"
-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Relative numbers
vim.opt.number = true -- Show absolute line number on current line
vim.opt.relativenumber = true -- Show relative numbers on other lines
-- Autoformat on sase
vim.g.autoformat = true
-- Make cmd line at the bottom of a window to be hidden
vim.opt.cmdheight = 0
-- Set window separator characters
vim.opt.fillchars = {
	vert = "│",
	horiz = "─",
	horizup = "┴",
	horizdown = "┬",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
}
-- Global statusline (single statusline at bottom)
vim.opt.laststatus = 3
-- Additional configs
require("config.configs.diagnostics")
require("config.configs.persistent-undo")
