#!/bin/sh

cd
echo 'Setting up symlinks'
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/vimrc .vimrc

echo 'Installing Vundle'
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
