-- Fix bg of selected curson line
vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#1b1b1b" })

-- Win separator
vim.api.nvim_set_hl(0, "ColorfulWinSep", { fg = "#61afef", bold = true })

-- Git diff
vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { fg = "#ffffff", bg = "#432d44" })
vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#2d1f2e" })
vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { fg = "#ffffff", bg = "#1e3f40" })
vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#1a2f30" })
