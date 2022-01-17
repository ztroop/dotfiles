export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/go/bin:/usr/share/vscode/bin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias code="code-oss"
alias eg="sudo eopkg"
alias ls="exa --long --header --git --all"
alias l="exa --long --header --git --all"
alias cat="bat -p"
alias vim="nvim"
alias vi="nvim"
alias b="bat -p"
