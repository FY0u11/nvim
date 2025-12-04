return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local servers = {
				lua_ls = vim.tbl_deep_extend("force", vim.lsp.config["lua_ls"], {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
						},
					},
				}),
				gopls = false,
				rust_analyzer = false,
				ts_ls = false,
				jsonls = false,
				yamlls = false,
			}
			-- Reusable on_attach function for all LSP servers
			local on_attach = function(_, bufnr)
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
				end
				-- Documentation
				map("n", "gk", vim.lsp.buf.signature_help, "Show signature help")
				-- Code actions
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
				map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
				-- Go specific
				if vim.bo[bufnr].filetype == "go" then
					map("n", "<leader>cg", ":!go run .<CR>", "Go run")
				end
			end
			for name, config in pairs(servers) do
				if not config then
					servers[name] = vim.lsp.config[name]
				end
				servers[name] = vim.tbl_extend("force", servers[name], {
					on_attach = on_attach,
				})
			end
			for name, config in pairs(servers) do
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end
		end,
	},
}
