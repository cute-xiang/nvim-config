-- ~/.config/nvim/init.lua
-- 配置入口:只负责“组装”,不写具体逻辑

-- leader 必须在任何映射/插件加载之前设置
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')   -- 原生选项
require('plugins')   -- 插件清单(vim.pack)
require('ui')        -- 主题/外观
