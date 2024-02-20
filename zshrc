export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls="eza --long --header --git --all"
alias b="bat -p"
alias vim="nvim"
alias vi="nvim"

export TERM="xterm-256color"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ "$TMUX" = "" ]; then tmux -2; fi
