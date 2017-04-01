#!/usr/bin/sh 

git clone https://github.com/albertoCaroM/dotzsh.git  ~/.dotzsh 
cd ~/.dotzsh 
git submodule update --init --recursive 
ln -s ~/.dotzsh/fzf ~/.fzf  
~/.fzf/install --all
cp ~/.dotzsh/machinerc ~/.machinerc
mv ~/.zshrc ~/.zshrc.old 
ln -s ~/.dotzsh/zshrc ~/.zshrc 
zsh
