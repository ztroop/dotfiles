export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

create_alias_if_command_exists() {
    local command=$1
    local alias_command=$2
    if command -v "$command" > /dev/null 2>&1; then
        alias "$alias_command=$command"
    fi
}

create_alias_if_command_exists "exa --long --header --git" "ls"
create_alias_if_command_exists "exa --long --header --git --all" "l"
create_alias_if_command_exists "bat -p" "cat"
create_alias_if_command_exists "bat -p" "b"
create_alias_if_command_exists "nvim" "n"
create_alias_if_command_exists "nvim" "vim"
create_alias_if_command_exists "nvim" "vi"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$TMUX" = "" ]; then tmux -2; fi

export TERM="xterm-256color"

alias tmux='tmux -2'
alias tmux='tmux -u'
