#!/bin/zsh

emulate -R sh

cp -r $HOME/.config/i3/ $HOME/dotfiles/
cp -r $HOME/.config/i3status/ $HOME/dotfiles/
cp -r $HOME/.config/polybar/ $HOME/dotfiles/
cp $HOME/.vimrc $HOME/dotfiles/.vimrc
cp $HOME/.zshrc $HOME/dotfiles/.zshrc
cp $HOME/.Xresources $HOME/dotfiles/.Xresources
cp -r $HOME/.config/termite/ $HOME/dotfiles
