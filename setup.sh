#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
ln -fs $BASEDIR/vimrc ~/.vimrc

# pathogen
mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

ln -fs $BASEDIR/bundle ~/.vim/
mkdir -p ~/.vim/colors
ln -fs $BASEDIR/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
