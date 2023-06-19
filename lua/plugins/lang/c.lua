return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ccls = {
					cmd = { "ccls" },
					filetypes = { "c", "cpp", "objc", "objcpp" },
					root_dir = function(fname)
						local util = require("lspconfig.util")
						local root_files = {
							"compile_commands.json",
							".ccls",
							".git",
							".svn",
							".root",
						}
						return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
					end,
					init_options = {
						compilationDatabaseDirectory = "build",
						index = {
							threads = 0,
						},
						cache = {
							directory = "/tmp/ccls-cache",
						},
						clang = {
							excludeargs = { "-frounding-math" },
						},
					},
					settings = {
						semanticTokens = true,
					},
				},
			},
			setup = {},
		},
	},
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "c",
                "cpp",
                "cmake",
                "ninja",
            })
        end,
    }
}
