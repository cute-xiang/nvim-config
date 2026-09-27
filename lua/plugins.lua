-- ~/.config/nvim/lua/plugins.lua
-- 唯一的“插件清单”。vim.pack 是 Neovim 0.12 内置的插件管理器,无需 lazy.nvim

vim.pack.add({
  -- tokyonight 配色:锁定在 v4 大版本内(允许 4.x 更新,不跨到 5.0)
  {
    src = 'https://github.com/folke/tokyonight.nvim',
    version = vim.version.range('4'),
  },
})
