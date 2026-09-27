-- ~/.config/nvim/lua/ui.lua
-- 外观:配色主题(后续状态栏也放这里)

require('tokyonight').setup({
  style = 'night',          -- 你选的 night
  transparent = false,      -- 想让终端背景透出来就改 true
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
})

vim.cmd('colorscheme tokyonight')  -- 必须在 setup 之后
