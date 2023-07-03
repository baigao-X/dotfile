return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
        opts = {
            -- Automatically format on save
            autoformat = false,

            servers = {
                jsonls = {
                    autostart = false,
                },
                lua_ls = {
                    autostart = false,
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
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
            },
        },
    },
}
