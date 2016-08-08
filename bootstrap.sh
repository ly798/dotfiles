#!/bin/bash

DIR=`pwd`

echo "zsh..."
ln -s $DIR/zsh/zshrc $HOME/.zshrc
ln -s $DIR/zshr/oh-my-zsh $HOME/.oh-my-zsh

echo "git..."
ln -s $DIR/git/gitconfig $home/.gitconfig

echo "terminator..."
ln -s $DIR/terminator/config $HOME/.config/terminator/config

echo "tmux..."
ln -s $DIR/tmux/tmux.conf $HOME/.tmux.conf
