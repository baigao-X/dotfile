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
		--   {
		--       "ianding1/leetcode.vim",
		-- config = function()
		--           vim.g.leetcode_china = 1
		--           vim.g.leetcode_browser = "chrome"
		--       end,
		--   },
		--   {
		--       "iamcco/coc-leetcode",
		--       dependencies = {
		--           "neoclide/coc.nvim",
		--       },
		--   },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            ---@type string
            arg = "leetcode.nvim",

            ---@type lc.lang
            lang = "cpp",

            cn = { -- leetcode.cn
                enabled = true, ---@type boolean
                translator = true, ---@type boolean
                translate_problems = true, ---@type boolean
            },

            ---@type lc.storage
            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },

            ---@type table<string, boolean>
            plugins = {
                non_standalone = false,
            },

            ---@type boolean
            logging = true,

            injector = {}, ---@type table<lc.lang, lc.inject>

            cache = {
                update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
            },

            console = {
                open_on_runcode = true, ---@type boolean

                dir = "row", ---@type lc.direction

                size = { ---@type lc.size
                    width = "90%",
                    height = "75%",
                },

                result = {
                    size = "60%", ---@type lc.size
                },

                testcase = {
                    virt_text = true, ---@type boolean

                    size = "40%", ---@type lc.size
                },
            },

            description = {
                position = "left", ---@type lc.position

                width = "40%", ---@type lc.size

                show_stats = true, ---@type boolean
            },

            ---@type lc.picker
            picker = { provider = nil },

            hooks = {
                ---@type fun()[]
                ["enter"] = {},

                ---@type fun(question: lc.ui.Question)[]
                ["question_enter"] = {},

                ---@type fun()[]
                ["leave"] = {},
            },

            keys = {
                toggle = { "q" }, ---@type string|string[]
                confirm = { "<CR>" }, ---@type string|string[]

                reset_testcases = "r", ---@type string
                use_testcase = "U", ---@type string
                focus_testcases = "H", ---@type string
                focus_result = "L", ---@type string
            },

            ---@type lc.highlights
            theme = {},

            ---@type boolean
            image_support = false,
        },
    },
    {
        "simrat39/symbols-outline.nvim",
        lazy = true,
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
        config = function()
            local opts = {
                highlight_hovered_item = true,
                show_guides = true,
                auto_preview = false,
                position = "right",
                relative_width = true,
                width = 25,
                auto_close = false,
                show_numbers = false,
                show_relative_numbers = false,
                show_symbol_details = true,
                preview_bg_highlight = "Pmenu",
                autofold_depth = nil,
                auto_unfold_hover = true,
                fold_markers = { "", "" },
                wrap = false,
                keymaps = { -- These keymaps can be a string or a table for multiple keys
                    close = { "<Esc>", "q" },
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "<C-space>",
                    toggle_preview = "K",
                    rename_symbol = "r",
                    code_actions = "a",
                    fold = "h",
                    unfold = "l",
                    fold_all = "P",
                    unfold_all = "U",
                    fold_reset = "Q",
                },
                lsp_blacklist = {},
                symbol_blacklist = {},
                symbols = {
                    File = { icon = "", hl = "@text.uri" },
                    Module = { icon = "", hl = "@namespace" },
                    Namespace = { icon = "", hl = "@namespace" },
                    Package = { icon = "", hl = "@namespace" },
                    Class = { icon = "𝓒", hl = "@type" },
                    Method = { icon = "ƒ", hl = "@method" },
                    Property = { icon = "", hl = "@method" },
                    Field = { icon = "", hl = "@field" },
                    Constructor = { icon = "", hl = "@constructor" },
                    Enum = { icon = "", hl = "@type" },
                    Interface = { icon = "ﰮ", hl = "@type" },
                    Function = { icon = "", hl = "@function" },
                    Variable = { icon = "", hl = "@constant" },
                    Constant = { icon = "", hl = "@constant" },
                    String = { icon = "𝓐", hl = "@string" },
                    Number = { icon = "#", hl = "@number" },
                    Boolean = { icon = "", hl = "@boolean" },
                    Array = { icon = "", hl = "@constant" },
                    Object = { icon = "", hl = "@type" },
                    Key = { icon = "🔐", hl = "@type" },
                    Null = { icon = "NULL", hl = "@type" },
                    EnumMember = { icon = "", hl = "@field" },
                    Struct = { icon = "𝓢", hl = "@type" },
                    Event = { icon = "🗲", hl = "@type" },
                    Operator = { icon = "+", hl = "@operator" },
                    TypeParameter = { icon = "𝙏", hl = "@parameter" },
                    Component = { icon = "󰡀", hl = "@function" },
                    Fragment = { icon = "", hl = "@constant" },
                },
            }
            require("symbols-outline").setup(opts)
        end,
    },
}
