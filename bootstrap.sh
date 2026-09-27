#!/usr/bin/env bash
# 在新机器上一键复原本配置(先把仓库 clone 到 ~/.config/nvim)
set -euo pipefail

echo "==> 1/2 安装系统依赖"
sudo pacman -S --needed \
  neovim git curl ripgrep wl-clipboard \
  pyright bash-language-server lua-language-server marksman \
  tree-sitter-python tree-sitter-bash

echo "==> 2/2 按 nvim-pack-lock.json 安装插件"
nvim --headless "+qa" 2>/dev/null || true

echo "==> 完成。运行 nvim 即可。"
