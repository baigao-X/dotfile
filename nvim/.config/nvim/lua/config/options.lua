-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
--
local opt = vim.opt

opt.tabstop = 4                                       -- Number of spaces tabs count for
opt.shiftwidth = 4                                    -- Size of an indent
opt.wrap = true                                       -- 自动换行
opt.textwidth = 120                                   -- 设置一行最大显示字符
-- opt.colorcolumn = 120
opt.enc="utf-8"
opt.fenc="utf-8"
opt.fencs={"utf-8", "gbk", "gb180230", "usc-bom", "euc-jpk", "gb2312", "cp936"}
opt.fileformats={"unix", "dos"}
opt.eol = false
opt.eof = false
opt.endofline = false
opt.binary = false

vim.g.autoformat = false

vim.opt.list = true
vim.opt.listchars = {tab = ">-", space = "."}

-- 剪贴板配置
vim.opt.clipboard = "unnamedplus"
-- 确保使用正确的剪贴板提供者
if vim.fn.has('unix') == 1 then
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard',
      ['*'] = 'xclip -selection primary',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -o',
      ['*'] = 'xclip -selection primary -o',
    },
    cache_enabled = 1,
  }
end
