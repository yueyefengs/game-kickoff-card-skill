#!/usr/bin/env bash
# 游戏立项卡 skill 安装脚本
# 用法: ./install.sh [claude|hermes|codex|all]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/game-kickoff-card"
SKILL_NAME="game-kickoff-card"

if [[ ! -d "$SRC" ]]; then
  echo "✗ 找不到 skill 源目录: $SRC" >&2
  exit 1
fi

install_to() {
  local tool="$1" base="$2"
  local dest="$base/$SKILL_NAME"
  mkdir -p "$base"
  rm -rf "$dest"
  cp -R "$SRC" "$dest"
  echo "✓ 已安装到 $tool: $dest"
}

target="${1:-}"
if [[ -z "$target" ]]; then
  echo "安装游戏立项卡 skill 到哪个工具？"
  echo "  1) Claude   (~/.claude/skills/)"
  echo "  2) Hermes   (~/.hermes/skills/)"
  echo "  3) Codex    (~/.codex/skills/)"
  echo "  4) 全部"
  read -rp "请选择 [1-4]: " choice
  case "$choice" in
    1) target="claude" ;;
    2) target="hermes" ;;
    3) target="codex" ;;
    4) target="all" ;;
    *) echo "✗ 无效选择" >&2; exit 1 ;;
  esac
fi

case "$target" in
  claude) install_to "Claude" "$HOME/.claude/skills" ;;
  hermes) install_to "Hermes" "$HOME/.hermes/skills" ;;
  codex)  install_to "Codex"  "$HOME/.codex/skills" ;;
  all)
    install_to "Claude" "$HOME/.claude/skills"
    install_to "Hermes" "$HOME/.hermes/skills"
    install_to "Codex"  "$HOME/.codex/skills"
    ;;
  *) echo "✗ 未知目标: $target (可选 claude|hermes|codex|all)" >&2; exit 1 ;;
esac

echo ""
echo "完成！在对话里说「我想做个游戏，帮我填立项卡」即可触发。"
