#!/bin/sh

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#alacritty
cd ~
mkdir alacritty
cp ~/.config/nvim/move/alacritty.yml ~/alacritty

#tmux
cp ~/.config/nvim/move/.tmux.conf ~/

echo "alias vim=\"nvim\"" >> ~/.zshrc

#yay
git clone https://aur.archlinux.org/yay-git.git ~/yay
cd ~/yay
makepkg -si

#google-chrome
yay -S google-chrome
yay -Syu



