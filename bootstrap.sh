#!/bin/bash

DAY=`date +"%Y-%m-%d-%H:%M"`
DIR=`pwd`
BACK_DIR=$HOME/.dotfileback
CABAL_DIR=$HOME/.cabal
ARIA_DIR=$HOME/.aria2

if [ -d $BACK_DIR ];then
    echo ".dotfileback exist"
else
    mkdir $BACK_DIR
    echo "create .dotfileback"
fi

if [ ! -d $CABAL_DIR ];then
    mkdir $CABAL_DIR
fi

if [ ! -d $ARIA_DIR ];then
    mkdir $ARIA_DIR
fi

# param: source_path,  target_path,  [backup_name]
function mount() {
    source_path=$DIR/$1
    target_path=$HOME/$2
    backup_path=$BACK_DIR/$2.$DAY

    if [ $# -eq 3 ]; then
        backup_path=$BACK_DIR/$3.$DAY
    fi

    if [ -L $target_path ];then
        unlink $target_path
    elif [ -f $target_path -o -d $target_path ];then
        mv $target_path $backup_path
    fi

    ln -s $source_path $target_path
}

### ZSH ###
echo "zsh..."
mount zsh/aliases .aliases aliases
mount zsh/oh-my-zsh .oh-my-zsh oh-my-zsh
mount zsh/zshrc .zshrc zshrc
mount zsh/zshenv .zshenv zshenv
mount zsh/extra .extra extra
mount zsh/cht .zsh.d/_cht cht


### VIM ###
echo "vim..."
mount vim/vimrc .vimrc vimrc


### TERMINATOR ###
echo "terminator..."
mkdir -p .config/terminator
mount terminator/config .config/terminator/config terminator_config


### SPACEMACS ###
echo "spacemacs..."
mount emacs/spacemacs .spacemacs
#mount emacs/.emacs.d .emacs.d emacs.d


### SOURCE ###
echo "pip source..."
mkdir -p ~/.pip
mount source/pip.conf .pip/pip.conf pip.conf

#echo "cabal source..."
#mount source/cabal.conf .cabal/config cabal.conf

### aria2 ###
#echo "aria2..."
#mount other/aria2.conf .aria2/aria2.conf aria2.conf

### git ###
echo "git..."
mount git/gitconfig .gitconfig gitconfig
