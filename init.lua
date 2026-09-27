-- ~/.config/nvim/init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')    -- 原生选项
require('plugins')    -- 插件清单(vim.pack)
require('ui')         -- 主题 + 状态栏
require('editing')    -- 编辑增强
require('lsp')        -- LSP
require('keymaps')    -- 快捷键
