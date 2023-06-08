return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		opts = {
			window = {
				mappings = {
					["<space>"] = "none",
					["h"] = "navigate_up",
					["l"] = "open",
					["L"] = "focus_preview",
				},
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = {
			defaults = {
				mappings = {
					i = {
						["jj"] = { "<esc>", type = "command" },
						["<C-j>"] = function(...)
							return require("telescope.actions").move_selection_next(...)
						end,
						["<C-k>"] = function(...)
							return require("telescope.actions").move_selection_previous(...)
						end,
					},
				},
			},
		},
	},
	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	{
		"skywind3000/asynctasks.vim",
		dependencies = {
			"skywind3000/asyncrun.vim",

			config = function()
				vim.g.asyncrun_open = 10
				vim.g.asyncrun_rootmarks = { ".svn", ".git", ".root", ".work" }
			end,
		},
		keys = {
			{ "<F6>", "<cmd>AsyncTask default-build<cr>", desc = "执行默认任务" },
		},
		config = function()
			vim.g.asynctasks_config_name = "task/.vim-task"
		end,
	},
}
