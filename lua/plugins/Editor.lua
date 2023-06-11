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
        keys = {
            -- lsp 
            { "<leader>gd", "<cmd>Telescope definitions<CR>", desc = "Goto definitions" },
            { "<leader>gr", "<cmd>Telescope references<CR>", desc = "Goto references" },
        },
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
		--- 多光标操作
		"mg979/vim-visual-multi",
	},
	{
		--- 当相对行号无意义时，自动切换为绝对行号
		"jeffkreeftmeijer/vim-numbertoggle",
	},
	{
		--- 高亮标记字符
		"inkarkat/vim-mark",
		dependencies = {
			"inkarkat/vim-ingo-library",
		},
		keys = {
			{ "<leader>mm", "<Plug>MarkSet<CR>", desc = "设置高亮标记" },
			{ "<leader>ms", "<Plug>MarkToggle<CR>", desc = "切换高亮标记显示状态" },
			{ "<leader>mr", "<Plug>MarkRegex<CR>", desc = "设置正则高亮标记" },
			{ "<leader>mc", "<Plug>MarkClear<CR>", desc = "清除指定高亮标记" },
			{ "<leader>ma", "<Plug>MarkConfirmAllClear<CR>", desc = "清除全部高亮标记" },
		},
		config = function()
			vim.g.mwDefaultHighlightingPalette = "maximun" -- 增强配色
			vim.g.mwAutoSaveMarks = 1 -- 自动保存以前会话中的标记
			vim.g.mwAutoLoadMarks = 1 -- 自动从以前的会话中恢复标记
		end,
	},
	-- {
	-- 	--- 显示打开文本的 git/svn 修改状态
	-- 	"mhinz/vim-signify",
	-- },
	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	{
		"skywind3000/asynctasks.vim",
		dependencies = {
			"skywind3000/asyncrun.vim",

			config = function()
				vim.g.asyncrun_open = 10 -- 执行asyncrun任务时，自动打开quickfix window,高度为10
				vim.g.asyncrun_rootmarks = { ".svn", ".git", ".root", ".work" }
			end,
			keys = {
				{ "<F5>", ":call asyncrun#quickfix_toggle(6)<cr>", desc = "toogle quickfix" },
			},
		},
		keys = {
			{ "<F6>", "<cmd>AsyncTask default-build<cr>", desc = "执行默认任务" },
		},
		config = function()
			vim.g.asynctasks_config_name = "task/.vim-task"
		end,
	},
}
