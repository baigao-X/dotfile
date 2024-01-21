return {
	"mfussenegger/nvim-dap",
	dependencies = {

		-- fancy UI for the debugger
		{
			"rcarriga/nvim-dap-ui",
			-- stylua: ignore
			config = {
				layouts = {
					{
						elements = {
							{id = 'scopes', size = 0.25},
							{id = "stacks", size = 0.55},
							{id = "breakpoints", size = 0.10},
							{id = "watches", size = 0.10},
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							"repl"
						},
						size = 25,
						position = "bottom",
					}
				},
			},
		},

		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			config = {
				enabled = true,
				enable_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = true,
				show_stop_reason = true,
				commented = false,
				only_first_definition = true,
				all_references = true,
				filter_references_pattern = '<module',
				virt_text_pos = 'eol',
				all_frames = false,
				virt_lines = false,
				virt_text_win_col = nil
			},
		},
	},

	keys = {
		{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
		{ "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
		{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
		{ "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
		{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
		{ "<leader>dj", function() require("dap").down() end, desc = "Down" },
		{ "<leader>dk", function() require("dap").up() end, desc = "Up" },
		{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
		{ "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
		{ "<leader>dn", function() require("dap").step_over() end, desc = "Step Over(Next)" },
		{ "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
		{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
		{ "<leader>ds", function() require("dap").session() end, desc = "Session" },
		{ "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
		{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
	},

	config = function()
		vim.fn.sign_define('DapBreakpoint', {text='󰑊', texthl='', linehl='', numhl=''})
		vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

		local dap = require('dap')
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = 'OpenDebugAD7',
		}

		dap.configurations.cpp = {
			-- launch exe
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopAtEntry = true,
			},
			-- attach process
			{
				name = "Attach process",
				type = "cppdbg",
				request = "attach",
				processId = require('dap.utils').pick_process,
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				setupCommands = {
					{
						description = 'enable pretty printing',
						text = '-enable-pretty-printing',
						ignoreFailures = false
					},
				},
			},
			-- attach server
			{
				name = 'Attach to gdbserver :1234',
				type = 'cppdbg',
				request = 'launch',
				MIMode = 'gdb',
				miDebuggerServerAddress = 'localhost:1234',
				miDebuggerPath = '/usr/bin/gdb',
				cwd = '${workspaceFolder}',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
