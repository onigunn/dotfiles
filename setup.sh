#!/bin/sh

cd
echo 'Setting up symlinks'
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/vimrc .vimrc

echo 'Installing Vundle'
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

if [ -d "~/.oh-my-zsh" ]; then
	echo 'Installing oh-my-zsh'
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi
