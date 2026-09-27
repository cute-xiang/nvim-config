# Neovim 配置(原生 · 极简 · 可复现)

面向 Neovim 0.12+。尽量用原生能力,仅 3 个插件;插件版本由 `nvim-pack-lock.json` 精确锁定。

## 依赖(Arch Linux)
    sudo pacman -S --needed neovim git curl ripgrep wl-clipboard \
      pyright bash-language-server lua-language-server marksman \
      tree-sitter-python tree-sitter-bash

## 目录结构
    init.lua              入口,只负责 require
    nvim-pack-lock.json   插件版本锁 —— 必须提交到 git
    bootstrap.sh          新机器一键复原
    lua/
      options.lua         原生选项
      plugins.lua         vim.pack 插件清单
      ui.lua              tokyonight 主题 + mini.statusline
      editing.lua         mini.nvim 编辑增强
      treesitter.lua      原生语法高亮
      completion.lua      blink.cmp 补全
      lsp.lua             原生 LSP(pyright/bashls/lua_ls/marksman)
      keymaps.lua         快捷键(leader = 空格)

## 在新机器复原
    git clone <你的仓库> ~/.config/nvim
    ~/.config/nvim/bootstrap.sh
    nvim

## 插件管理(vim.pack)
- 同步:启动 nvim 即按 lockfile 安装/对齐版本
- 全量更新:`:lua vim.pack.update()` → 审阅 → `:write` 确认 / `:quit` 放弃
- 单个更新:`:lua vim.pack.update({ 'blink.cmp' })`
- 冻结:把 plugins.lua 里该项 `version` 改成 lockfile 里的 `rev` 字符串
- 回滚:git checkout HEAD -- nvim-pack-lock.json → 重启
        → `:lua vim.pack.update({'名字'}, { offline = true, target = 'lockfile' })`

## 常用快捷键
    <C-h/j/k/l>   窗口间移动        <S-h>/<S-l>  上/下个缓冲区
    <leader>bd    关闭缓冲区        <Esc>        清除搜索高亮
    gd/gD/gr/gi   定义/声明/引用/实现     K        悬停文档
    <leader>rn    重命名            <leader>ca   代码操作
    <leader>f     格式化            ]d/[d        下/上一条诊断
    gcc / gc      注释行 / 注释选区
    补全:<C-y> 确认,<C-n>/<C-p> 选择,<C-space> 呼出,<C-k> 签名
    surround:saiw) 加括号,sd) 删,sr)' 换;文本对象:va)/via)

## AI生成，勿喷，第一次开启新大门！  喵喵
