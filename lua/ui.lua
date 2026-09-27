-- ~/.config/nvim/lua/ui.lua
-- 配色(透明)+ 状态栏

require('tokyonight').setup({
  style = 'night',
  transparent = true,          -- 关键:Normal 等不设背景 → 露出 kitty 的透明度
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = 'transparent',  -- 侧栏透明
    floats = 'transparent',    -- 浮窗(如 LSP 悬停)透明
  },
})

-- 补全菜单/浮窗的高亮组 link 到 Pmenu / NormalFloat,
-- 这里把背景清掉,让菜单也透出 kitty 背景(保留 PmenuSel 选中背景,便于辨认)
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    for _, g in ipairs({ 'Pmenu', 'NormalFloat', 'FloatBorder', 'FloatTitle' }) do
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = g })
      if ok and hl.bg then
        hl.bg = nil
        vim.api.nvim_set_hl(0, g, hl)
      end
    end
  end,
})

vim.cmd('colorscheme tokyonight')

require('mini.statusline').setup({
  use_icons = false,   -- 没有等宽 Nerd 字体,先用文字
})
