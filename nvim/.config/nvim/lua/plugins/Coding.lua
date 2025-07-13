return {
	{
		"robitx/gp.nvim",
		config = function()
			local gemini_api_key = os.getenv("GEMINI_API_KEY")
			
			if not gemini_api_key then
				vim.notify("GEMINI_API_KEY 环境变量未设置", vim.log.levels.ERROR)
				return
			end
			
			require("gp").setup({
				-- 完全禁用 OpenAI
				openai_api_key = nil,
				providers = {
					openai = nil, -- 禁用 OpenAI provider
					googleai = {
						endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:generateContent?key=" .. gemini_api_key,
						secret = gemini_api_key,
					},
				},
				-- 只配置 Gemini 代理，覆盖默认配置
				agents = {
					{
						name = "Gemini-Flash",
						provider = "googleai", 
						chat = true,
						command = true,
						model = { model = "gemini-1.5-flash", temperature = 0.7, top_p = 1 },
						system_prompt = "You are a helpful coding assistant. Always respond in the same language as the user's input.",
					},
				},
				-- 设置默认代理
				default_command_agent = "Gemini-Flash",
				default_chat_agent = "Gemini-Flash",
				
				chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
				chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
				chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
				chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
			})
			
			-- 自定义快捷键，明确指定使用 Gemini 代理
			vim.keymap.set({'n', 'v'}, '<leader>ai', '<cmd>GpChatNew Gemini-Flash<cr>', { desc = "新建 Gemini 对话" })
			vim.keymap.set({'n', 'v'}, '<leader>ac', '<cmd>GpAppend Gemini-Flash<cr>', { desc = "Gemini 代码补全" })
			vim.keymap.set({'n', 'v'}, '<leader>ar', '<cmd>GpRewrite Gemini-Flash<cr>', { desc = "Gemini 重写代码" })
			
			-- 创建自定义的解释代码命令
			vim.keymap.set({'n', 'v'}, '<leader>ae', function()
				-- 获取选中的文本或当前行
				local mode = vim.fn.mode()
				local text = ""
				if mode == 'v' or mode == 'V' then
					-- 可视模式下获取选中文本
					vim.cmd('normal! "zy')
					text = vim.fn.getreg('z')
				else
					-- 普通模式下获取当前行
					text = vim.fn.getline('.')
				end
				
				-- 构建解释提示
				local prompt = "请解释以下代码的功能和工作原理：\n\n" .. text
				
				-- 创建新的聊天会话并发送提示
				vim.cmd('GpChatNew Gemini-Flash')
				-- 等待聊天窗口打开后发送消息
				vim.defer_fn(function()
					vim.api.nvim_put({prompt}, 'l', true, true)
					vim.cmd('normal! G')
				end, 100)
			end, { desc = "Gemini 解释代码" })
			
			-- 添加调试命令
			vim.api.nvim_create_user_command('GpDebug', function()
				print("=== GP.nvim 调试信息 ===")
				
				-- 检查模块是否存在
				local ok, gp = pcall(require, "gp")
				if ok then
					print("✅ gp.nvim 模块加载成功")
					
					-- 检查代理配置
					if gp.agents then
						print("当前配置的代理:")
						for name, agent in pairs(gp.agents) do
							print("- " .. name .. " (provider: " .. agent.provider .. ")")
						end
					else
						print("❌ 没有找到代理配置")
					end
					
					-- 列出所有 Gp 命令
					print("\n可用的 Gp 命令:")
					local commands = vim.api.nvim_get_commands({})
					local gp_commands = {}
					for name, _ in pairs(commands) do
						if string.match(name, "^Gp") then
							table.insert(gp_commands, name)
						end
					end
					
					if #gp_commands > 0 then
						for _, cmd in ipairs(gp_commands) do
							print("- " .. cmd)
						end
					else
						print("❌ 没有找到 Gp 命令")
					end
				else
					print("❌ gp.nvim 模块加载失败: " .. tostring(gp))
				end
				
				-- 检查 API Key
				local api_key = os.getenv("GEMINI_API_KEY")
				print("\nAPI Key: " .. (api_key and "已设置 (前10字符: " .. string.sub(api_key, 1, 10) .. "...)" or "未设置"))
				
			end, { desc = "GP.nvim 调试信息" })
			
		end,
	},
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
            theme = {
                ["alt"] = {
                    bg = "#FFFFFF",
                },
                ["normal"] = {
                    fg = "#EA4AAA",
                },
            },

            ---@type boolean
            image_support = false,

            keymaps = {
                vim.keymap.set({'n', 'v'}, '<leader>tl', ':Leet list<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>td', ':Leet desc<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>to', ':Leet open<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>ty', ':Leet yank<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>ti', ':Leet info<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>tt', ':Leet test<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>ts', ':Leet submit<CR>'),
                vim.keymap.set({'n', 'v'}, '<leader>tr', ':Leet last_submit<CR>'),
            }
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
