#!/bin/sh
DOTFILES=~/.dotfiles

cd
echo 'Setting up symlinks'
ln -sf $DOTFILES/zshrc $HOME/.zshrc
ln -sf $DOTFILES/vimrc $HOME/.vimrc
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf

if [ ! -d "~/.vim/bundle/vundle" ]; then
	echo 'Installing Vundle'
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

if [ ! -d "~/.oh-my-zsh" ]; then
	echo 'Installing oh-my-zsh'
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ -d "$DOTFILES/base16-shell" ]; then
    rm -rf $DOTFILES/base16-shell
fi

echo 'Cloning base16 shell'
git clone https://github.com/chriskempson/base16-shell.git $DOTFILES/base16-shell
