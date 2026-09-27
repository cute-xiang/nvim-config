-- ~/.config/nvim/lua/editing.lua
require('mini.pairs').setup()      -- 自动补全括号/引号
require('mini.surround').setup()   -- 环绕:sa 添加 / sd 删除 / sr 替换
require('mini.ai').setup()         -- 更强的文本对象
require('mini.bufremove').setup()  -- 安全删除缓冲区
