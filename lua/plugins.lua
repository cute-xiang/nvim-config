-- ~/.config/nvim/lua/plugins.lua
vim.pack.add({
  { -- 配色:锁 4.x
    src = 'https://github.com/folke/tokyonight.nvim',
    version = vim.version.range('4'),
  },
  { -- 主题/状态栏/编辑增强模块:锁 0.x
    src = 'https://github.com/echasnovski/mini.nvim',
    version = vim.version.range('0'),
  },
  { -- 补全:锁 1.x
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range('1'),
  },
})
