#!/bin/bash

# dotfiles セットアップスクリプト
#
# Usage:
#   ./sync.sh       → 上書き前に確認を求める
#   ./sync.sh -f    → 確認なしで強制上書き

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
FORCE=false

# オプション解析
while getopts "f" opt; do
    case $opt in
        f) FORCE=true ;;
        *) echo "Usage: $0 [-f]"; exit 1 ;;
    esac
done

echo "dotfiles セットアップを開始します..."
echo "dotfiles ディレクトリ: $DOTFILES_DIR"

# .zshrc をコピー
if [ -f "$HOME/.zshrc" ]; then
    if [ "$FORCE" = true ]; then
        cp "$HOME/.zshrc" "$HOME/.zshrc_backup"
        echo "バックアップ作成: ~/.zshrc_backup"
        cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
        echo "✓ ~/.zshrc をコピーしました"
    else
        echo "既存の ~/.zshrc が見つかりました"
        echo "上書きしますか？ (y/n)"
        read -r answer
        if [ "$answer" != "y" ]; then
            echo "スキップしました"
        else
            cp "$HOME/.zshrc" "$HOME/.zshrc_backup"
            echo "バックアップ作成: ~/.zshrc_backup"
            cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
            echo "✓ ~/.zshrc をコピーしました"
        fi
    fi
else
    cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo "✓ ~/.zshrc をコピーしました"
fi

# .zsh_aliases をコピー
if [ -f "$HOME/.zsh_aliases" ]; then
    if [ "$FORCE" = true ]; then
        cp "$HOME/.zsh_aliases" "$HOME/.zsh_aliases_backup"
        echo "バックアップ作成: ~/.zsh_aliases_backup"
        cp "$DOTFILES_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"
        echo "✓ ~/.zsh_aliases をコピーしました"
    else
        echo "既存の ~/.zsh_aliases が見つかりました"
        echo "上書きしますか？ (y/n)"
        read -r answer
        if [ "$answer" != "y" ]; then
            echo "スキップしました"
        else
            cp "$HOME/.zsh_aliases" "$HOME/.zsh_aliases_backup"
            echo "バックアップ作成: ~/.zsh_aliases_backup"
            cp "$DOTFILES_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"
            echo "✓ ~/.zsh_aliases をコピーしました"
        fi
    fi
else
    cp "$DOTFILES_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"
    echo "✓ ~/.zsh_aliases をコピーしました"
fi

echo ""
echo "セットアップ完了！"
echo "source ~/.zshrc で反映してください。"
