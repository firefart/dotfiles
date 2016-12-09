#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
ln -fs $BASEDIR/vim/vimrc ~/.vimrc

# pathogen
ln -fs ln -fs $BASEDIR/vim/vim-pathogen/autoload ~/.vim/

ln -fs $BASEDIR/vim/bundle ~/.vim/
mkdir -p ~/.vim/colors
ln -fs $BASEDIR/vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
