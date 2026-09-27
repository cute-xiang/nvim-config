-- ~/.config/nvim/lua/lsp.lua
-- 原生 LSP:自己定义服务器,不依赖 nvim-lspconfig

-- 1) 诊断外观
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- 2) 各语言服务器
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
})

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh' },
  root_markers = { '.git' },
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  root_markers = { '.marksman.toml', '.git' },
})

-- 3) 通配配置:把“补全能力”交给 blink.cmp(插件没加载则退回默认)
local has_blink, blink = pcall(require, 'blink.cmp')
vim.lsp.config('*', {
  capabilities = has_blink and blink.get_lsp_capabilities()
    or vim.lsp.protocol.make_client_capabilities(),
})

-- 4) 服务器连上后挂快捷键
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local map = vim.keymap.set
    local o = { buffer = ev.buf, silent = true }
    map('n', 'gd', vim.lsp.buf.definition, o)
    map('n', 'gD', vim.lsp.buf.declaration, o)
    map('n', 'gr', vim.lsp.buf.references, o)
    map('n', 'gi', vim.lsp.buf.implementation, o)
    map('n', 'K',  vim.lsp.buf.hover, o)
    map('n', '<leader>rn', vim.lsp.buf.rename, o)
    map('n', '<leader>ca', vim.lsp.buf.code_action, o)
    map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, o)
    map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, o)
    map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, o)
  end,
})

-- 5) 启用
vim.lsp.enable({ 'pyright', 'bashls', 'lua_ls', 'marksman' })
