#!/bin/bash

DAY=`date +"%Y-%m-%d-%H:%M"`
DIR=`pwd`
BACK_DIR=$HOME/.dotfileback
CABAL_DIR=$HOME/.cabal

if [ -d $BACK_DIR ];then
    echo ".dotfileback exist"
else
    mkdir $BACK_DIR
    echo "create .dotfileback"
fi

if [ ! -d $CABAL_DIR ];then
    mkdir $CABAL_DIR
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
mount zsh/aliases .aliases
mount zsh/oh-my-zsh .oh-my-zsh
mount zsh/zshrc .zshrc
mount zsh/exports .exports
mount zsh/extra .extra


### VIM ###
echo "vim..."
mount vim/vimrc .vimrc


### TERMINATOR ###
echo "terminator..."
mount terminator/config .config/terminator/config .config


### SPACEMACS ###
echo "spacemacs..."
mount emacs/spacemacs .spacemacs
mount emacs/.emacs.d .emacs.d


### SOURCE ###
echo "pip source..."
mount source/pip.conf .pip/pip.conf pip.conf

echo "cabal source..."
mount source/cabal.conf .cabal/config cabal.conf


### ATOM ###
echo "atom..."
mount atom/init.coffee .atom/init.coffee atom.init.coffee
mount atom/config.cson .atom/config.cson atom.config.cson
mount atom/keymap.cson .atom/keymap.cson atom.keymap.cson
mount atom/snippets.cson .atom/snippets.cson atom.snippets.cson
mount atom/styles.less .atom/styles.less atom.styles.less
