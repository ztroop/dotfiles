#!/bin/bash

# Function to display help information
display_help() {
    echo "Usage: ./setup.sh [option]"
    echo
    echo "Options:"
    echo "  tools               Install ZSH and tools"
    echo "  autosuggestions     Install zsh-autosuggestions"
    echo "  syntaxhighlighting  Install zsh-syntax-highlighting"
    echo "  nvm                 Install NVM"
    echo "  rust                Install Rust"
    echo "  config              Copy config files"
    echo "  help                Display this help message"
    echo
    echo "Without any options, all tools will be installed."
}

# Function to install ZSH and tools
install_tools() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Assuming Mac
        if ! command -v brew &>/dev/null; then
            echo "Homebrew not found. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        echo "Installing/updating tools using Homebrew..."
        brew install zsh bat tmux eza pyenv
    else
        # Assuming Linux

        if ! command -v pyenv &>/dev/null; then
            echo "Installing pyenv..."
            /bin/bash -c "$(curl https://pyenv.run)"
        else
            echo "pyenv is already installed."
        fi

        echo "You will to install bat and eza manually."
        if command -v apt &>/dev/null; then
            echo "Using APT to install/update tools..."
            sudo apt-get update
            sudo apt-get install -y zsh tmux
        elif command -v yum &>/dev/null; then
            echo "Using YUM to install/update tools..."
            sudo yum update
            sudo yum install -y zsh tmux
        else
            echo "Package manager not supported. Please install ZSH manually."
            return 1
        fi
    fi

    # Install Oh My Zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh not found. Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi
}

# Define ZSH_CUSTOM if it's not already set
if [ -z "${ZSH_CUSTOM}" ]; then
    ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

# Clone zsh-autosuggestions if it doesn't already exist
install_zsh_autosuggestions() {
    if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    else
        echo "zsh-autosuggestions is already installed."
    fi
}

# Clone zsh-syntax-highlighting if it doesn't already exist
install_zsh_syntax_highlighting() {
    if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    else
        echo "zsh-syntax-highlighting is already installed."
    fi
}

# Check if nvm is installed; install it if not
install_nvm() {
    if [ -z "${NVM_DIR}" ]; then
        echo "nvm not found. Installing nvm..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh)"
    else
        echo "nvm is already installed."
    fi
}

# Check if Rust is installed; install it if not
install_rust() {
    if command -v cargo &>/dev/null; then
        echo "Rust is already installed. Updating..."
        rustup update
    else
        echo "Rust not found. Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
}

# Copy the configuration files to the home directory
copy_config_files() {
    # Copy the .zshrc file to the home directory
    cp zshrc ~/.zshrc
    # Copy the .tmux.conf file to the home directory
    cp tmux.conf ~/.tmux.conf
    echo "Configuration files copied."
}

# Check command line arguments
if [ $# -eq 0 ]; then
    install_tools
    install_zsh_autosuggestions
    install_zsh_syntax_highlighting
    install_nvm
    install_rust
    copy_config_files
else
    for arg in "$@"; do
        case $arg in
        tools) install_tools ;;
        autosuggestions) install_zsh_autosuggestions ;;
        syntaxhighlighting) install_zsh_syntax_highlighting ;;
        nvm) install_nvm ;;
        rust) install_rust ;;
        config) copy_config_files ;;
        help) display_help ;;
        *) echo "Invalid argument: $arg" ;;
        esac
    done
fi
