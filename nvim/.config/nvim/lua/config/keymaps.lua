-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		if opts.remap and not vim.g.vscode then
			opts.remap = nil
		end
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- 设置jk 为 ESC键
map("i", "jk", "<ESC>", { desc = "ESC" })
map("n", "<Leader>q", ":q<cr>", { desc = "退出当前窗口" })
map("n", "<Leader>w", ":w<cr>", { desc = "保存当前窗口" })

-- 系统剪贴板复制快捷键
map("v", "<C-S-c>", function()
  vim.cmd('normal! "+y')
  vim.notify("已复制到系统剪贴板")
end, { desc = "复制到系统剪贴板" })
map("n", "<C-S-c>", function()
  vim.cmd('normal! "+yy')
  vim.notify("已复制整行到系统剪贴板")
end, { desc = "复制整行到系统剪贴板" })
