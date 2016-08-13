#!/bin/bash

DAY=`date +"%Y-%m-%d-%H:%M"`
DIR=`pwd`
BACK_DIR=$HOME/.dotfileback

if [ -d $BACK_DIR ];then
    echo ".dotfileback exist"
else
    mkdir $BACK_DIR 
    echo "create .dotfileback"
fi

echo "zsh..."
if [ -L $HOME/.zshrc ];then
    unlink $HOME/.zshrc
elif [ -f $HOME/.zshrc ];then
    mv $HOME/.zshrc $BACK_DIR/.zshrc.$DAY
fi
ln -s $DIR/zsh/zshrc $HOME/.zshrc


if [ -L $HOME/.oh-my-zsh ];then
    unlink $HOME/.oh-my-zsh
elif [ -f $HOME/.oh-my-zsh ];then
    mv $HOME/.oh-my-zsh $BACK_DIR/.oh-my-zsh.$DAY
fi
ln -s $DIR/zsh/oh-my-zsh $HOME/.oh-my-zsh

#echo "git..."
#ln -s $DIR/git/gitconfig $home/.gitconfig

echo "terminator..."
if [ -L $HOME/.config/terminator/config ];then
    unlink $HOME/.config/terminator/config 
elif [ -f $HOME/.config/terminator/config ];then
    mv $HOME/.config/terminator/config $BACK_DIR/.config.$DAY
fi
ln -s $DIR/terminator/config $HOME/.config/terminator/config

echo "tmux..."
if [ -L $HOME/.tmux.conf ];then
    unlink $HOME/.tmux.conf
elif [ -f $HOME/.tmux.conf ];then
    mv $HOME/.tmux.conf $BACK_DIR/.tmux.conf.$DAY
fi
ln -s $DIR/tmux/tmux.conf $HOME/.tmux.conf

echo "spacemacs..."
if [ -L $HOME/.spacemacs ];then
    unlink $HOME/.spacemacs
elif [ -f $HOME/.spacemacs ];then
    mv $HOME/.spacemacs $BACK_DIR/.spacemacs.$DAY
fi
ln -s $DIR/emacs/spacemacs $HOME/.spacemacs

echo "pip source..."
if [ -L $HOME/.pip/pip.conf ];then
    unlink $HOME/.pip/pip.conf
elif [ -f $HOME/.pip/pip.conf ];then
    mv $HOME/.pip/pip.conf $BACK_DIR/pip.conf.$DAY
fi
ln -s $DIR/source/pip.conf $HOME/.pip/pip.conf
