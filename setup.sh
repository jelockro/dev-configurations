#!/bin/bash
cp vimrc.bak ~/.vimrc
sudo apt-get update
sudo apt-get install -y vim git ctags
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/pack/vendor/start
git clone --depth 1 \
  https://github.com/preservim/nerdtree.git \
  ~/.vim/pack/vendor/start/nerdtree
cd ~/.vim/bundle
sudo pacman -S ctags
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
vim +PluginInstall +qall
