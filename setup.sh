#!/bin/bash

verify_installs() {
    if ! command -v nvim &> /dev/null; then
        echo "Installing neovim"
        sudo apt install -y neovim
    fi

    if ! command -v zsh &> /dev/null; then
        echo "Installing zsh"
        sudo apt install -y zsh
    fi

    if ! command -v tmux &> /dev/null; then
        echo "Installing tmux"
        sudo apt install -y tmux
    fi
}

setup_directories() {
    mkdir -p ~/.config/nvim
}

create_backups() {
    if [ -f "$HOME/.vimrc" ]; then
        echo "Backing up .vimrc"
        mv $HOME/.vimrc $HOME/.vimrc.bak
    fi
    
    if [ -f "$HOME/.zshrc" ]; then
        echo "Backing up .zshrc"
        mv $HOME/.zshrc $HOME/.zshrc.bak
    fi
    
    if [ -f "$HOME/.tmux.conf" ]; then
        echo "Backing up .tmux.conf"
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
    fi

    if [ -f "$HOME/.config/nvim/init.vim" ]; then
        echo "Backing up .config/nvim/init.vim"
        mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.bak
    fi
}

create_symlinks() {
    echo "Creating symlinks"
    ln -s $HOME/dev_config/vimrc $HOME/.vimrc
    ln -s $HOME/dev_config/zshrc $HOME/.zshrc
    ln -s $HOME/dev_config/tmux.conf $HOME/.tmux.conf
    ln -s $HOME/dev_config/init.vim $HOME/.config/nvim/init.vim
}

change_shell() {
    if [ "$SHELL" != "/bin/zsh" ]; then
        echo "Changing login shell to zsh. Enter password for $USER:"
        chsh -s /bin/zsh
    else
        echo "Login shell already zsh"
    fi
}

start_zsh() {
    echo "Starting zsh..."
    exec /bin/zsh -l
}

verify_installs
setup_directories
create_backups
create_symlinks
change_shell
start_zsh
