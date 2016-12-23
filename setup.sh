#!/bin/sh
DOTFILES=~/.dotfiles

cd
echo 'Setting up symlinks'
ln -sf $DOTFILES/Xdefaults $HOME/.Xdefaults
ln -sf $DOTFILES/zshrc $HOME/.zshrc
ln -sf $DOTFILES/vimrc $HOME/.vimrc
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/gitconfig $HOME/.gitconfig

if [! -d "~/.dotfiles/base16-shell"]
  git clone https://github.com/chriskempson/base16-shell.git ~/.dotfiles/base16-shell
fi

if [ ! -d "~/.vim/bundle/vundle" ]; then
	echo 'Installing Vundle'
	# git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "~/.oh-my-zsh" ]; then
	echo 'Installing oh-my-zsh'
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi
