-- theme
vim.cmd.colorscheme("oxocarbon")

-- copy & paste to windows and vice-versa
vim.opt.clipboard = "unnamedplus"

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- relative numbers
vim.opt.number = true -- Show absolute line number on current line
vim.opt.relativenumber = true -- Show relative numbers on other lines

-- autoformat on sase
vim.g.autoformat = true

-- make cmd line at the bottom of a window to be hidden
vim.opt.cmdheight = 0

-- additional configs
require("config.configs.diagnostics")
require("config.configs.persistent-undo")
