-- ~/.config/nvim/lua/plugins.lua
vim.pack.add({
  -- 配色:锁 4.x
  {
    src = 'https://github.com/folke/tokyonight.nvim',
    version = vim.version.range('4'),
  },
  -- mini.nvim:一个仓库、多个模块
  {
    src = 'https://github.com/echasnovski/mini.nvim',
    version = vim.version.range('0'),
  },
})
