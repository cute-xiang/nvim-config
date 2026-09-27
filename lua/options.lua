-- ~/.config/nvim/lua/options.lua
-- 原生选项。vim.opt 是“智能版 :set”,可接受布尔/数字/字符串/列表

local opt = vim.opt

-- 界面
opt.number = true            -- 显示绝对行号
opt.relativenumber = true    -- 相对行号(方便 3j / 5k 跳转)
opt.cursorline = true        -- 高亮当前行
opt.termguicolors = true     -- 真彩色(主题必须,否则颜色发灰)
opt.signcolumn = 'yes'       -- 始终保留标记列(避免诊断出现时文字抖动)
opt.scrolloff = 8            -- 光标距上下边缘至少保留 8 行
opt.wrap = false             -- 代码不自动折行
opt.splitright = true        -- 垂直分屏开在右边
opt.splitbelow = true        -- 水平分屏开在下边
opt.showmode = false         -- 隐藏 --INSERT-- 提示(交给状态栏)

-- 编辑
opt.expandtab = true         -- 按 Tab 输入空格
opt.tabstop = 4              -- 一个 Tab 显示为 4 空格
opt.shiftwidth = 4           -- 自动缩进 4 空格
opt.softtabstop = 4          -- 编辑时 Tab 键对应 4 空格
opt.smartindent = true       -- 智能缩进
opt.mouse = 'a'              -- 全模式鼠标

-- 搜索
opt.ignorecase = true        -- 搜索忽略大小写
opt.smartcase = true         -- 但输入含大写时区分大小写

-- 文件/会话
opt.undofile = true          -- 撤销历史持久化
opt.swapfile = false         -- 不用交换文件
opt.backup = false           -- 不生成备份
opt.updatetime = 250         -- 空闲 250ms 触发(诊断/高亮)
opt.timeoutlen = 400         -- 快捷键等待 400ms

-- 剪贴板:与系统 Wayland 剪贴板互通(已装 wl-clipboard)
opt.clipboard = 'unnamedplus'
