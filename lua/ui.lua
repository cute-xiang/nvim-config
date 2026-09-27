-- ~/.config/nvim/lua/ui.lua
require('tokyonight').setup({
  style = 'night',
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
})
vim.cmd('colorscheme tokyonight')

require('mini.statusline').setup({
  use_icons = false,   -- 没有等宽 Nerd 字体,先用文字
})
