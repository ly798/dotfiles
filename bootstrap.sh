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

### ZSH ###
echo "zsh..."
if [ -L $HOME/.zshrc ];then
    unlink $HOME/.zshrc
elif [ -f $HOME/.zshrc ];then
    mv $HOME/.zshrc $BACK_DIR/.zshrc.$DAY
fi
if [ -L $HOME/.oh-my-zsh ];then
    unlink $HOME/.oh-my-zsh
elif [ -d $HOME/.oh-my-zsh ];then
    mv $HOME/.oh-my-zsh $BACK_DIR/.oh-my-zsh.$DAY
fi
if [ -L $HOME/.aliases ];then
    unlink $HOME/.aliases
elif [ -d $HOME/.aliases ];then
    mv $HOME/.aliases $BACK_DIR/.aliases.$DAY
fi
if [ -L $HOME/.exports ];then
    unlink $HOME/.exports
elif [ -d $HOME/.exports ];then
    mv $HOME/.exports $BACK_DIR/.exports.$DAY
fi
if [ -L $HOME/.extra ];then
    unlink $HOME/.extra
elif [ -d $HOME/.extra ];then
    mv $HOME/.extra $BACK_DIR/.extra.$DAY
fi
ln -s $DIR/zsh/aliases $HOME/.aliases
ln -s $DIR/zsh/oh-my-zsh $HOME/.oh-my-zsh
ln -s $DIR/zsh/zshrc $HOME/.zshrc
ln -s $DIR/zsh/exports $HOME/.exports
ln -s $DIR/zsh/extra $HOME/.extra


### VIM ###
echo "vim..."
if [ -L $HOME/.vimrc ];then
    unlink $HOME/.vimrc
elif [ -d $HOME/.vimrc ];then
    mv $HOME/.vimrc $BACK_DIR/.vimrc.$DAY
fi
ln -s $DIR/vim/vimrc $HOME/.vimrc


### TERMINATOR ###
echo "terminator..."
if [ -L $HOME/.config/terminator/config ];then
    unlink $HOME/.config/terminator/config 
elif [ -f $HOME/.config/terminator/config ];then
    mv $HOME/.config/terminator/config $BACK_DIR/.config.$DAY
fi
ln -s $DIR/terminator/config $HOME/.config/terminator/config


### SPACEMACS ###
echo "spacemacs..."
if [ -L $HOME/.spacemacs ];then
    unlink $HOME/.spacemacs
elif [ -f $HOME/.spacemacs ];then
    mv $HOME/.spacemacs $BACK_DIR/.spacemacs.$DAY
fi
ln -s $DIR/emacs/spacemacs $HOME/.spacemacs


### SOURCE ###
echo "pip source..."
if [ -L $HOME/.pip/pip.conf ];then
    unlink $HOME/.pip/pip.conf
elif [ -f $HOME/.pip/pip.conf ];then
    mv $HOME/.pip/pip.conf $BACK_DIR/pip.conf.$DAY
fi
ln -s $DIR/source/pip.conf $HOME/.pip/pip.conf

echo "cabal source..."
if [ -L $HOME/.cabal/config ];then
    unlink $HOME/.cabal/config
elif [ -f $HOME/.cabal/config ];then
    mv $HOME/.cabal/config $BACK_DIR/cabal.conf.$DAY
fi
ln -s $DIR/source/cabal.conf $HOME/.cabal/config


### ATOM ###
echo "atom..."
if [ -L $HOME/.atom/init.coffee ];then
    unlink $HOME/.atom/init.coffee
elif [ -f $HOME/.atom/init.coffee ];then
    mv $HOME/.atom/init.coffee $BACK_DIR/atom.init.coffee.$DAY
fi
if [ -L $HOME/.atom/config.cson ];then
    unlink $HOME/.atom/config.cson
elif [ -f $HOME/.atom/config.cson ];then
    mv $HOME/.atom/config.cson $BACK_DIR/atom.config.cson.$DAY
fi
if [ -L $HOME/.atom/keymap.cson ];then
    unlink $HOME/.atom/keymap.cson
elif [ -f $HOME/.atom/keymap.cson ];then
    mv $HOME/.atom/keymap.cson $BACK_DIR/atom.keymap.cson.$DAY
fi
if [ -L $HOME/.atom/snippets.cson ];then
    unlink $HOME/.atom/snippets.cson
elif [ -f $HOME/.atom/snippets.cson ];then
    mv $HOME/.atom/snippets.cson $BACK_DIR/atom.snippets.cson.$DAY
fi
if [ -L $HOME/.atom/styles.less ];then
    unlink $HOME/.atom/styles.less
elif [ -f $HOME/.atom/styles.less ];then
    mv $HOME/.atom/styles.less $BACK_DIR/atom.styles.less.$DAY
fi
ln -s $DIR/atom/init.coffee $HOME/.atom/init.coffee
ln -s $DIR/atom/config.cson $HOME/.atom/config.cson
ln -s $DIR/atom/keymap.cson $HOME/.atom/keymap.cson
ln -s $DIR/atom/snippets.cson $HOME/.atom/snippets.cson
ln -s $DIR/atom/styles.less $HOME/.atom/styles.less
