return {
	{
		"theniceboy/antovim",
		keys = {
			{ "<leader>an", "<Cmd>Antovim<CR>", desc = "Switch antonym" },
		},
		config = function()
			vim.g.custom_antovim_definitions = {
				{ "this", "that" },
				{ "yes", "no", "maybe" },
				{ "true", "false" },
				{ "TRUE", "FALSE" },
				{ "ON", "OFF" },
				{ "on", "off" },
				{ "OPEN", "CLOSE" },
				{ "open", "close" },
				{ "start", "stop" },
				{ "debug", "relese" },
				{ "Debug", "Relese" },
				{ "STATIC", "SHARED" },
				{ "==", "!=" },
			}
		end,
	},
	{
		--- 快速对齐
		"junegunn/vim-easy-align",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", desc = "格式对齐" },
			-- 如 gaip= 即对page内根据第一次出现的=作对齐
			-- =  第1次出现=
			-- 2= 第2次出现=
			-- *= 在所有情况下
			-- **= 所有事件周围的左右交替排列
			-- <Space> 第1次出现空白
			-- 2<Space> 第2次出现空白
			-- -<Space> 最后一次出现空白
			-- <Enter><Enter>2<Space> 第2次出现的空白中心对齐
			-- <Enter> 在 左/右/中心对齐模式之间切换
			-- <C-P> 实际交互模式
			-- <C-X> 正则表达式实际交互模式
		},
	},
}
