#!/bin/sh
DOTFILES=~/.dotfiles

cd
echo 'Setting up symlinks'
ln -sf $DOTFILES/Xdefaults $HOME/.Xdefaults
ln -sf $DOTFILES/zshrc $HOME/.zshrc
ln -sf $DOTFILES/vimrc $HOME/.vimrc
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/gitconfig $HOME/.gitconfig

if [ ! -d "$DOTFILES/base16-shell/" ]; then
  git clone https://github.com/chriskempson/base16-shell.git $DOTFILES/base16-shell
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim/" ]; then
	echo 'Installing Vundle'
	# git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
	echo 'Installing oh-my-zsh'
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# if [ ! -d "$DOTFILES/powerline-fonts/" ]; then
#   echo "Installing powerline patched fonts"
#   cd $DOTFILES
#   git clone https://github.com/powerline/fonts.git powerline-fonts && cd powerline-fonts && sh install.sh
# fi

