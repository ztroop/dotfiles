export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/go/bin:/usr/share/vscode/bin:$HOME/bin:$HOME/.local/share/gem/ruby/3.1.0/bin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias code="code-oss"
alias eg="sudo eopkg"
alias ls="exa --long --header --git"
alias l="exa --long --header --git --all"
alias cat="bat -p"
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias b="bat -p"
alias ..="cd .."
alias binstall="bundle install --path=vendor/bundle"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$TMUX" = "" ]; then tmux -2; fi

export TERM="xterm-256color"

alias tmux='tmux -2'
alias tmux='tmux -u'  
