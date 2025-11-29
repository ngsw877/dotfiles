###### 環境変数 ######

# direnv
export EDITOR=vim
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"

# tenv
export TENV_AUTO_INSTALL=true

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/shims:$PATH"
    eval "$(pyenv init -)"
fi

# Locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

###### peco ######

if command -v peco &> /dev/null; then
    function peco-select-history() {
        BUFFER=$(\history -n -r 1 | distinct | peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle reset-prompt
    }
    zle -N peco-select-history
    bindkey '^r' peco-select-history
fi

###### エイリアス読み込み ######

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
