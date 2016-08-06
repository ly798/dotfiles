#!/bin/bash

DIR=`pwd`

echo "zsh..."
ln -s $DIR/zsh/zshrc $HOME/.zshrc
ln -s $DIR/zshr/oh-my-zsh $HOME/.oh-my-zsh

echo "git..."
ln -s $DIR/git/gitconfig $home/.gitconfig

