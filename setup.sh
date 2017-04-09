#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

git submodule init
git submodule update

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
rm -rf ~/.vim/
mkdir -p ~/.vim/
mkdir -p ~/.vim/bundle/
ln -fs $BASEDIR/vim/vimrc ~/.vimrc

# pathogen
ln -fs $BASEDIR/vim/plugins/vim-pathogen/autoload ~/.vim/

# plugins
rm -rf ~/.vim/bundle
ln -fs $BASEDIR/vim/plugins/ ~/.vim/bundle

# colors
mkdir -p ~/.vim/colors
ln -fs $BASEDIR/vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim

# bash
ln -fs $BASEDIR/aliases ~/.bash_aliases
# ln -fs $BASEDIR/bashrc ~/.bashrc

