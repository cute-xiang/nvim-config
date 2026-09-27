-- ~/.config/nvim/lua/keymaps.lua
local map = vim.keymap.set
local o = { silent = true }   -- 0.11+ 默认已是 noremap

map('n', '<C-h>', '<C-w>h', o)   -- 窗口间移动
map('n', '<C-j>', '<C-w>j', o)
map('n', '<C-k>', '<C-w>k', o)
map('n', '<C-l>', '<C-w>l', o)

map('n', '<S-l>', '<cmd>bnext<cr>', o)      -- 缓冲区切换
map('n', '<S-h>', '<cmd>bprevious<cr>', o)

map('n', '<leader>bd', function()           -- 关缓冲区留窗口
  require('mini.bufremove').delete(0, false)
end, o)

map('n', '<Esc>', '<cmd>nohlsearch<cr>', o) -- 清搜索高亮
