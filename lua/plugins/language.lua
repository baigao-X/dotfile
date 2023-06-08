return {
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_start = 1
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refrese_slow = 1
			vim.g.mkdp_conmand_for_global = 1
			vim.g.mkdp_open_to_the_world = 1
			vim.g.mkdp_open_ip = ""
			vim.g.mkdp_browser = ""
			vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_browserfunc = ""
			vim.g.mkdp_markdown_css = ""
			vim.g.mkdp_highlight_css = ""
			vim.g.mkdp_port = "8080"
			vim.g.mkdp_page_title = "${name}"
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		keys = {
			{ "<Leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "markdown 预览" },
		},
	},
	-- cmake-tools
	{
		"Civitasv/cmake-tools.nvim",
	},
}
