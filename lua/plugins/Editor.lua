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
			-- { "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Goto definitions" },
			-- { "<leader>gr", "<cmd>Telescope lsp_references<CR>", desc = "Goto references" },
			-- { "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Goto implementations" },
			-- { "<leader>ga", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Goto Symbol (Workspace)" },
			-- { "<leader>gA", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Goto Symbol" },
		},
        config = function()
            vim.keymap.del({'n'}, "<leader><space>")
        end,
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
        "ggandor/leap.nvim",
        keys = {
            { "s", mode = { "n", "x", "o" }, desc = "Leap orward" },
            -- { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            -- { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
            -- { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)

            vim.keymap.del({'x', 'o'}, 'x')
            vim.keymap.del({'x', 'o'}, 'X')
            -- To set alternative keys for "exclusive" selection:
            vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward-till)')
            vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward-till)')

            -- vim.keymap.del({'n', 'x', 'o'}, 's')
            vim.keymap.del({'n', 'x', 'o'}, 'S')
            vim.keymap.del({'n', 'x', 'o'}, 'gs')
            -- 全屏搜索
            vim.keymap.set('n', 's', function ()
                local focusable_windows_on_tabpage = vim.tbl_filter(
                    function (win) return vim.api.nvim_win_get_config(win).focusable end,
                    vim.api.nvim_tabpage_list_wins(0)
                )
                require('leap').leap { target_windows = focusable_windows_on_tabpage }
            end)

            -- The below settings make Leap's highlighting closer to what you've been
            -- used to in Lightspeed.

            -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
            vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
            vim.api.nvim_set_hl(0, 'LeapMatch', {
                -- For light themes, set to 'black' or similar.
                fg = 'white', bold = true, nocombine = true,
            })
            -- Of course, specify some nicer shades instead of the default "red" and "blue".
            -- vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
            --     fg = 'yellow', bold = true, nocombine = true,
            -- })
            vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
                fg = 'blue', bold = true, nocombine = true,
            })
            -- Try it without this setting first, you might find you don't even miss it.
            require('leap').opts.highlight_unlabeled_phase_one_targets = true
        end,
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
		init = function()
			vim.g.mw_no_mappings = 0
			vim.g.mwDefaultHighlightingPalette = "maximum" -- 增强配色
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
        opts = {
            templates = {
                "builtin",
                "user.sh_build",
                "user.cpp_build",
                "user.run_script"
            },
        },
        -- config = function()
        --    require("overseer").setup({
        --         templates = { "builtin", "user.cpp_build" },
        --     })
        -- end,
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
			vim.g.asynctasks_config_name = ".task/.vim-task"
		end,
	},
	{
		"sindrets/diffview.nvim",
	},
    {
        "lambdalisue/suda.vim"
    },
}
