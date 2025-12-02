return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "leoluz/nvim-dap-go" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			require("dap-go").setup()

			-- Functions to set keymaps for arrow keys, and to restore original keymaps
			local original_keymaps = {}
			local function set_debug_keymaps()
				-- Save original mappings
				original_keymaps["<Left>"] = vim.fn.maparg("<Left>", "n", false, true)
				original_keymaps["<Down>"] = vim.fn.maparg("<Down>", "n", false, true)
				original_keymaps["<Right>"] = vim.fn.maparg("<Right>", "n", false, true)
				original_keymaps["<Up>"] = vim.fn.maparg("<Up>", "n", false, true)
				-- Set debug mappings
				vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Debug: Step Out" })
				vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Debug: Step Over" })
				vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Debug: Step Into" })
				vim.keymap.set("n", "<Up>", dap.continue, { desc = "Debug: Continue" })
			end
			local function restore_keymaps()
				vim.keymap.del("n", "<Left>")
				vim.keymap.del("n", "<Down>")
				vim.keymap.del("n", "<Right>")
				vim.keymap.del("n", "<Up>")
				-- Restore original mappings if they existed
				for key, map in pairs(original_keymaps) do
					if map and map.lhs then
						vim.keymap.set("n", key, map.rhs or map.callback, {
							silent = map.silent == 1,
							expr = map.expr == 1,
						})
					end
				end
				original_keymaps = {}
			end

			-- Set up auto-commands for DAP events
			dap.listeners.after.event_initialized["debug_keys"] = set_debug_keymaps
			dap.listeners.before.event_terminated["debug_keys"] = restore_keymaps
			dap.listeners.before.event_exited["debug_keys"] = restore_keymaps
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Keymaps
			vim.keymap.set("n", "<Leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "Toggle dap ui" })
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" })
			vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/continue" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Conditional breakpoint" })
			vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate" })

			-- Set icons
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "󰃤", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "DapBreakpointCondition" }
			)
			vim.fn.sign_define("DapStopped", {
				text = "▶",
				texthl = "DapStopped",
				linehl = "DapStoppedLine",
				numhl = "DapStopped",
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "repl",
								size = 1,
							},
						},
						position = "bottom",
						size = 20,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})
		end,
	},
}
