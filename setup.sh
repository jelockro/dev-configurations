#!/bin/bash
cp vimrc.bak ~/.vimrc
sudo apt-get update
working_directory=$(pwd)
ZSH_CUSTOM="${HOME}/.oh-my-zsh/themes"
# Install VIM components
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

# Install Fonts
cd ${working_directory}
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
curl -fLo FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

# Install oh-my-zsh & Powerlevel 10k
# gh cli
cd ${working_directory}
echo "Sanity Check: What is ZSH_CUSTOM: $ZSH_CUSTOM. \n"
echo "Where are we: $(pwd) \n" 
#git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "source ${ZSH_CUSTOM}/themes/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install tools
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py --user
# Install tools
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py --user
#python -m pip install --user ansible
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
#install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#chmod +x kubectl
#mkdir -p ~/.local/bin
#mv ./kubectl ~/.local/bin/kubectl
#kubectl version --client

