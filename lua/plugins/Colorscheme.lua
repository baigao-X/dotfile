return {
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/everforest" },
	{
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { 
            -- style = "day" ,
            -- style = "night" ,
            -- style = "storm" ,
            style = "moon" ,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "gruvbox",
            colorscheme = "gruvbox-material",
            -- colorscheme = "everforest",
			-- colorscheme = "tokyonight",
		},
	},
}
