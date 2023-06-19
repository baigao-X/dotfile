return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		dependencies = {
			{
				"mrjones2014/nvim-ts-rainbow",
			},
		},
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		---@type TSConfig
		opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            rainbow = {
                ---"mrjones2014/nvim-ts-rainbow" config

                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
		},
       opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "bash",
                "diff",
                "dot",
                "lua",
                "regex",
                "awk",
                "perl",
                "python",
                "markdown",
                "json",
                "html",
                "git_config",
                "gitignore",
            })
        end,
	},
}
