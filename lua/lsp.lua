-- ~/.config/nvim/lua/lsp.lua
-- 原生 LSP:自己定义服务器,不依赖 nvim-lspconfig

-- 1) 诊断外观
vim.diagnostic.config({
  virtual_text = { prefix = '●' },  -- 行尾内联显示诊断
  severity_sort = true,             -- 严重的排前面
  signs = true,                     -- 行号旁显示标记
  underline = true,                 -- 出错处下划线
  update_in_insert = false,         -- 插入模式不刷新(少打扰)
})

-- 2) 各语言服务器:cmd 指向 pacman 装的可执行文件
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
      runtime = { version = 'LuaJIT' },        -- nvim 用 LuaJIT 运行
      diagnostics = { globals = { 'vim' } },   -- 让 lua_ls 认识 vim 全局
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },          -- 关掉遥测
    },
  },
})

vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  root_markers = { '.marksman.toml', '.git' },
})

-- 3) 通配配置('*' 对每个 server 生效;blink.cmp 之后会在这里扩展 capabilities)
vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- 4) 服务器连上后,挂 buffer 级快捷键
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local map = vim.keymap.set
    local o = { buffer = ev.buf, silent = true }   -- 只在这个缓冲区生效
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

-- 5) 启用(按 filetypes 匹配、按 root_markers 找项目根)
vim.lsp.enable({ 'pyright', 'bashls', 'lua_ls', 'marksman' })
