export ZSH=~/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="arrow"

DISABLE_UPDATE_PROMPT=true

HIST_STAMPS="yyyy-mm-dd"

plugins=(git pod rails heroku)
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

zle -N expand-aliases
bindkey '\e^E' expand-aliases

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
