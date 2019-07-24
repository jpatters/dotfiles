#!/bin/bash

# Install homebrew
if [[ ! "which brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install oh-my-zsh
if [[ ! -e "$ZSH" ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install completions
if [[ ! -e "$ZSH/custom/plugins/zsh-syntax-highlighting" ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Link zshrc
rm $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# Link oh-my-zsh customizations
for filename in $HOME/dotfiles/.oh-my-zsh/custom/*.zsh; do
	name=$(basename $filename)
	rm $ZSH/custom/$name
	ln -s $filename $ZSH/custom/$name
done

# Install everything else
brew bundle

# Config
. config/git.sh
. config/gpg.sh
. config/vim.sh
