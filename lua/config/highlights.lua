-- Fix bg of selected cursor line
vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#1b1b1b" })

-- Win separator
vim.api.nvim_set_hl(0, "ColorfulWinSep", { fg = "#61afef", bold = true })

-- Git diff
vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { fg = "#ffffff", bg = "#432d44" })
vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2d1f2e" })
vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { fg = "#ffffff", bg = "#1e3f40" })
vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#1a2f30" })

-- Debug
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#BE95FF" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#8b42ff" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#FF7EB6" })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#4b363f" })
