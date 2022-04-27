#!/bin/bash
cp vimrc.bak ~/.vimrc
sudo apt-get update
sudo apt-get install -y vim git ctags zsh curl fonts-powerline
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/pack/vendor/start
git clone --depth 1 \
  https://github.com/preservim/nerdtree.git \
  ~/.vim/pack/vendor/start/nerdtree
cd ~/.vim/bundle
sudo pacman -S ctags
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
vim +PluginInstall +qall
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
curl -fLo FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
u
unzip FiraCode.zip -d ~/.fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv
