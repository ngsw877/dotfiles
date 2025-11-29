#!/bin/bash

# dotfiles セットアップスクリプト

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "dotfiles セットアップを開始します..."
echo "dotfiles ディレクトリ: $DOTFILES_DIR"

# .zshrc をコピー
if [ -f "$HOME/.zshrc" ]; then
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
else
    cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo "✓ ~/.zshrc をコピーしました"
fi

# .zsh_aliases をコピー
if [ -f "$HOME/.zsh_aliases" ]; then
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
else
    cp "$DOTFILES_DIR/zsh/.zsh_aliases" "$HOME/.zsh_aliases"
    echo "✓ ~/.zsh_aliases をコピーしました"
fi

echo ""
echo "セットアップ完了！"
echo "source ~/.zshrc で反映してください。"
