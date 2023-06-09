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
				{ "STATIC", "SHARED" },
				{ "==", "!=" },
			}
		end,
	},
	{
		--- 快速对齐
		"junegunn/vim-easy-align",
	},
}
