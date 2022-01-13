#!/bin/sh

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#alacritty
cd ~
mkdir alacritty
mv ~/.config/nvim/move/alacritty.yml ~/.config/alacritty

#tmux
mv ~/.config/nvim/move/.tmux.conf ~/


echo "alias vim=\"nvim\"" >> ~/.zshrc