-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
--
local opt = vim.opt

opt.tabstop = 4                                       -- Number of spaces tabs count for
opt.shiftwidth = 4                                    -- Size of an indent
opt.clipboard:append {"unnamedplus"}                  -- 设置vim复制到系统剪贴板，默认复制到vim内部的缓冲区
opt.wrap = true                                       -- 自动换行
opt.textwidth = 120                                   -- 设置一行最大显示字符
-- opt.colorcolumn = 120


