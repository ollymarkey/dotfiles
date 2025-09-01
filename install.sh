#!/bin/bash

# Define the source directory for your dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from: $DOTFILES_DIR"

# --- Create necessary base directories ---
echo "Creating ~/.config directory if it doesn't exist..."
mkdir -p ~/.config

# --- Symlink .config directories ---
echo "Creating symlinks for ~/.config/*"

# Neovim
if [ -d "$DOTFILES_DIR/.config/nvim" ]; then
    echo "  Linking ~/.config/nvim"
    ln -sf "$DOTFILES_DIR/.config/nvim" ~/.config/nvim
else
    echo "  Warning: Neovim config not found in dotfiles repo, skipping."
fi

# Tmux (linking the entire .config/tmux directory to ~/.config/tmux for newer tmux versions)
# OR, if you strictly use ~/.tmux.conf, link that directly.
# We'll include both, choose based on your preference.
if [ -d "$DOTFILES_DIR/.config/tmux" ]; then
    echo "  Linking ~/.config/tmux"
    ln -sf "$DOTFILES_DIR/.config/tmux" ~/.config/tmux
    # If you prefer to also have ~/.tmux.conf directly, uncomment this:
    # echo "  Linking ~/.tmux.conf to ~/.config/tmux/tmux.conf"
    # ln -sf "$DOTFILES_DIR/.config/tmux/tmux.conf" ~/.tmux.conf
else
    echo "  Warning: Tmux config not found in dotfiles repo, skipping."
fi

# --- Symlink individual files in home directory (if any) ---
echo "Creating symlinks for home directory files..."

# Example: .bashrc
if [ -f "$DOTFILES_DIR/.bashrc" ]; then
    echo "  Linking ~/.bashrc"
    ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc
else
    echo "  Warning: .bashrc not found in dotfiles repo, skipping."
fi

# Example: .zshrc (if you use Zsh)
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    echo "  Linking ~/.zshrc"
    ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
else
    echo "  Warning: .zshrc not found in dotfiles repo, skipping."
fi

# Hyprland
if [ -d "$DOTFILES_DIR/.config/hypr" ]; then
    echo "  Linking ~/.config/hypr"
    ln -sf "$DOTFILES_DIR/.config/hypr" ~/.config/hypr
else
    echo "  Warning: Hyprland config not found in dotfiles repo, skipping."
fi

echo "Dotfiles setup complete!"
