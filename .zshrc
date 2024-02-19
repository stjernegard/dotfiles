export ZSH=~/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="arrow"

DISABLE_UPDATE_PROMPT='true'

HIST_STAMPS="yyyy-mm-dd"

plugins=(git swiftpm docker docker-compose)
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi

expand-aliases() {
  unset 'functions[_expand-aliases]'
  functions[_expand-aliases]=$BUFFER
  (($+functions[_expand-aliases])) &&
    BUFFER=${functions[_expand-aliases]#$'\t'} &&
    CURSOR=$#BUFFER
}

function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

zle -N expand-aliases
bindkey '\e^E' expand-aliases

alias gfix='git diff --name-only | uniq | while read line ; do echo \"$line\" ; done | xargs -o vim -p'
gprune() {
    remote=${1-origin}
    permanent_branches="main|master|develop"
    git branch --merged | grep -v -E "(\*|$permanent_branches)" | xargs -n 1 git branch -d
    git remote prune $remote || git remote prune `git remote`
}
