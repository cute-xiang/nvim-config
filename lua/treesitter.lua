-- ~/.config/nvim/lua/treesitter.lua
vim.opt.runtimepath:append('/usr/share/tree-sitter')
vim.treesitter.language.register('bash', 'sh')   -- shell 的 ft 是 sh,语法树语言是 bash
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})
