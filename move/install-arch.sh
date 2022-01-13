sudo pacman -S wget curl git base-devel
sudo pacman -S zsh
zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Default shell zsh
chsh -s $(which zsh)

sudo pacman -S vim neovim python-pynvim

#fzf 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc

#rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

#fzf
brew install fzf
$(brew --prefix)/opt/fzf/install
echo "export FZF_DEFAULT_COMMAND='fdfind --type f'" >> ~/.zshrc
echo "export FZF_DEFAULT_OPTS=\"--layout=reverse --inline-info --height=80%\"" >> ~/.zshrc


export PATH="$HOME/.pyenv/bin:$PATH"

#pyenv
curl https://pyenv.run | bash
echo "eval '\$(pyenv virtualenv-init -)'" >> ~/.zshrc
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
