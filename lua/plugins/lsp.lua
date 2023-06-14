return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			-- add any global capabilities here
			capabilities = {},
			-- Automatically format on save
			autoformat = false,
			-- Enable this to show formatters used in a notification
			-- Useful for debugging formatter issues
			format_notify = false,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				jsonls = {
					mason = false,
				},
				lua_ls = {
					mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},

				ccls = {
					cmd = { "ccls" },
					filetypes = { "c", "cpp", "objc", "objcpp" },
					init_options = {
						compilationDatabaseDirectory = "build",
						index = {
							threads = 0,
						},
						cache = {
							directory = "/tmp/ccls-cache",
						},
						clang = {
							excludeArgs = { "-frounding-math" },
						},
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
					},
				},
			},
		},
	},
}
