-- ~/.config/nvim/lua/treesitter.lua
-- 原生 Treesitter 高亮:零插件,复用 pacman 安装的语法库

-- 1) 追加系统“查询”目录,让 nvim 找到 /usr/share/tree-sitter/queries/<lang>/*.scm
--    (parser 即 .so 文件,Arch 的 tree-sitter-* 包已软链进 nvim 的 runtime/parser/)
vim.opt.runtimepath:append('/usr/share/tree-sitter')

-- 2) 打开文件时对当前缓冲区启动 Treesitter 高亮
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    -- 缺 parser 或缺 queries 的语言(如 bash)会失败,
    -- 用 pcall 静默跳过,自动回退到 nvim 内置的 syntax/*.vim 高亮
    pcall(vim.treesitter.start, ev.buf)
  end,
})
