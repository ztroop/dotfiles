#!/bin/bash

# Function to install ZSH and tools
install_zsh_and_tools() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Assuming Mac
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        echo "Installing/updating tools using Homebrew..."
        brew install zsh bat tmux eza
    else
        # Assuming Linux
        if command -v apt &> /dev/null; then
            echo "Using APT to install/update tools..."
            sudo apt-get update
            sudo apt-get install -y zsh tmux
        elif command -v yum &> /dev/null; then
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

# Check if zsh is installed; install it if not
install_zsh_and_tools

# Define ZSH_CUSTOM if it's not already set
if [ -z "${ZSH_CUSTOM}" ]; then
    ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

# Clone zsh-autosuggestions if it doesn't already exist
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# Clone zsh-syntax-highlighting if it doesn't already exist
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Check if nvm is installed; install it if not
if [ -z "${NVM_DIR}" ]; then
    echo "nvm not found. Installing nvm..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh)"
else
    echo "nvm is already installed."
fi

if command -v cargo &> /dev/null; then
    echo "Rust is already installed. Updating..."
    rustup update
else
    echo "Rust not found. Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Copy the .zshrc file to the home directory
cp zshrc ~/.zshrc
# Copy the .tmux.conf file to the home directory
cp tmux.conf ~/.tmux.conf

echo "Installation and setup completed."
