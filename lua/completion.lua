-- ~/.config/nvim/lua/completion.lua
-- blink.cmp:来自 LSP / 路径 / 缓冲区 的自动补全

require('blink.cmp').setup({
  -- 没有等宽 Nerd 字体,用简约呈现
  appearance = { nerd_font_variant = 'none' },

  -- 默认按键:<C-y> 接受、<C-n>/<C-p> 上下选、<C-space> 呼出、<C-e> 取消
  keymap = { preset = 'default' },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 300 },
  },

  -- 数据来源:不加 'snippets',避免再引入 friendly-snippets 依赖
  sources = { default = { 'lsp', 'path', 'buffer' } },
})
